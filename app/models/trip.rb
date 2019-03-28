class Trip < ApplicationRecord
    belongs_to :employee
    has_one :reimbursement_form
    has_one :authorization_form
    has_many :requests
end
