class ReceiptsRequest < ApplicationRecord
    belongs_to :department
    belongs_to :status
    belongs_to :reimbursement_forms, optional: true
    
    has_many :receipts, inverse_of: :receipts_request
    
    validates :department_id,:reimbursement_form_id, presence: true
    validates :total_amount, numericality: {greater_than_or_equal_to: 0.01}

    accepts_nested_attributes_for :receipts, :reject_if => :all_blank, :allow_destroy => true
    
end
