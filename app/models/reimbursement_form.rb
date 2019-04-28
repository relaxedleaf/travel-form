class ReimbursementForm < ApplicationRecord
    belongs_to :employee
    belongs_to :trip
    belongs_to :status
    belongs_to :notification
    
    has_many :receipts_request, :dependent => :destroy
    has_many :receipts, :dependent => :destroy

    validates :status_id, :employee_id, :trip_id, presence: true
    
    accepts_nested_attributes_for :receipts_request, :reject_if => :all_blank, :allow_destroy => true
    after_commit :create_notifications, on: [:create]
    #need one for create

    def total_costs
        self.receipts.sum(:cost)
    end
    
    def check_amount(num1,num2)
        return num1.to_i > num2.to_i 
    end
    
    def create_notifications
        self.Notification.build(
            status_id :self.status_id)
    end
    
end
