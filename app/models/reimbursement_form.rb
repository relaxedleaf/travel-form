class ReimbursementForm < ApplicationRecord
    belongs_to :employee
    belongs_to :trip
    belongs_to :status
    
    has_many :receipts
    
    validates :status_id, :employee_id, :trip_id, presence: true

end
