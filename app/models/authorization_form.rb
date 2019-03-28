class AuthorizationForm < ApplicationRecord
    belongs_to :employee
    belongs_to :trip
    belongs_to :status
    
    has_many :requests
    has_many :wishes
end
