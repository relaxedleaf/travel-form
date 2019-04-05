class Trip < ApplicationRecord
    belongs_to :employee
    has_one :reimbursement_form, :dependent => :destroy
    has_one :authorization_form, :dependent => :destroy
    has_many :requests, :dependent => :destroy

    validates :purpose, :destination, :date_start, :date_end, :employee_id, presence: true
    accepts_nested_attributes_for :reimbursement_form
    
    accepts_nested_attributes_for :authorization_form
    accepts_nested_attributes_for :requests
end
