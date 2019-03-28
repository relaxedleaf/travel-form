class ReimbursementForm < ApplicationRecord
    belongs_to :employee
    belongs_to :trip
    belongs_to :status
    
    has_many :receipts
end
