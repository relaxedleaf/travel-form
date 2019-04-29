class Status < ApplicationRecord
    has_many :authorization_forms
    has_many :reimbursement_forms
    has_many :requests
    has_many :receipts_request
    has_many :reim_form_message
    validates :name, presence: true
    
    
    after_save :notify_user_status_change
    
    private
    
    def notify_user_status_change
        if name_changed?
            #do some to notify user.
        end
    end
    
    
    def hello
        @hello = "hello"
    end
end
