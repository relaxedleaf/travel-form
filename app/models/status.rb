class Status < ApplicationRecord
    has_many :authorization_forms
    has_many :reimbursement_forms
    
    validates :name, presence: true
end
