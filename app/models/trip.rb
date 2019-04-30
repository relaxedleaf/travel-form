class Trip < ApplicationRecord
    before_destroy :authform_status
    
    belongs_to :employee
    has_one :reimbursement_form, :dependent => :destroy
    has_one :authorization_form, :dependent => :destroy
    has_one :destination, :dependent => :destroy
    
    has_many :requests, :dependent => :destroy
    has_many :reim_form_message, :dependent => :destroy
    
    before_destroy :authform_status

    validates :purpose, :destination, :date_start, :date_end, :employee_id, presence: true
    accepts_nested_attributes_for :reimbursement_form
    validate :dates_validation
    validate :authform_status
    validate :requests_exceed_wishes
    after_create :create_auth_message
    
    accepts_nested_attributes_for :authorization_form
    accepts_nested_attributes_for :destination
    accepts_nested_attributes_for :requests
    
    
    
    def create_auth_message
        @status_id = Status.where(name: "Pending").take.id

        ReimFormMessage.create(trip_id: self.id,
                              status_id: @status_id,
                              employee_id: self.employee_id,
                              message: "A")
    end
    
    
    private
    
    def dates_validation
        ds = date_start.split('/').map(&:to_i) #date start
        de = date_end.split('/').map(&:to_i) #date end
        if !de[2].nil? && !ds[2].nil?
            if de[2] < ds[2] #year
                errors.add(:date_end,"can't be ealier than date start")
                throw :abort
            else
                if de[0] < ds[0] #month
                    errors.add(:date_end,"can't be ealier than date start")
                    throw :abort
                else
                    if de[0] == ds[0]
                        if de[1] < ds[1] #day
                            errors.add(:date_end,"can't be ealier than date start")
                            throw :abort
                        end
                    end
                end
            end
        end
    end
    
    def requests_exceed_wishes
        if requests.map(&:amount).sum > authorization_form.wishes.map(&:cost).sum
            errors.add(:requests,"exceeds your wishes")
            throw :abort
        end
    end
    
    def authform_status
       if self.authorization_form.status.name == "Approved"
            errors.add(" ","Form has already been approved")
            throw :abort
       else
          update_department_budget
       end
    end
    
    def update_department_budget
        requests = Request.where(trip_id: self.id.to_i)
        requests.each do |request|
        puts request.status.name
        if request.status.name == "Approved"
          request.department.update_attribute(:budget_hold, request.department.budget_hold - request.amount)
        end
      end       
    end
end
