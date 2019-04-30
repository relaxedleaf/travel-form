class ReimbursementForm < ApplicationRecord
    belongs_to :employee
    belongs_to :trip
    belongs_to :status
    has_many :notification, :dependent => :destroy

    has_many :receipts_request, :dependent => :destroy
    has_many :receipts, :dependent => :destroy

    validates :status_id, :employee_id, :trip_id, presence: true
    
    accepts_nested_attributes_for :receipts_request, :reject_if => :all_blank, :allow_destroy => true
    #after_update :change_status
    
    #no need for this method for now
    def change_status
        @receipts_request = ReceiptsRequest.where(reimbursement_form_id: self.id)
        @receipts_request.each do |receipts_request|
            receipts_request.update_attribute(:status_id, 1)
        end
    end

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
