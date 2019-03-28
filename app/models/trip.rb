class Trip < ApplicationRecord
    belongs_to :employee
    has_one :reimbursement_form
    has_one :authorization_form
    
    
    validates :purpose, :destination, :date_start, :date_end, :employee_id, presence: true

end
