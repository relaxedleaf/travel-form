class Receipt < ApplicationRecord
    belongs_to :reimbursement_form
    belongs_to :expense_type
end
