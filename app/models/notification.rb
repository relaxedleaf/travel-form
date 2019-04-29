class Notification < ApplicationRecord
    belongs_to :reimbursement_form
    belongs_to :authorization_form
    
    #validates :status_id, presence: true

end
