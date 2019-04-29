class ReimbursementForm < ApplicationRecord
    belongs_to :employee
    belongs_to :trip
    belongs_to :status
    has_many :notification

    has_many :receipts_request, :dependent => :destroy
    has_many :receipts, :dependent => :destroy

    validates :status_id, :employee_id, :trip_id, presence: true
    
    accepts_nested_attributes_for :receipts_request, :reject_if => :all_blank, :allow_destroy => true
    #after_commit :create_notifications, on: [:create]
    #need one for create

    def total_costs
        total_cost_request=0
        @requests.each do |cost|
         total_cost_request+= cost.amount
        end
        total_cost_request
    end
    
    def check_amount(num1,num2)
        return num1.to_i > num2.to_i 
    end
    
    def create_notifications
        @form = "R"
        Notification.create(
            status_id: self.status.id,
            form: @form,
            trip_id: self.trip.id
            )
    end
    
end
