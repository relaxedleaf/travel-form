class Trip < ApplicationRecord
    belongs_to :employee
    has_one :reimbursement_form
    has_one :authorization_form
    has_many :requests

    validates :purpose, :destination, :date_start, :date_end, :employee_id, presence: true
    accepts_nested_attributes_for :reimbursement_form

end
