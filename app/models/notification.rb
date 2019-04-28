class Notification < ApplicationRecord
    has_many :reimbursement_form
    has_many :authorization_form
    
    validates :now_status, presence: true

end
