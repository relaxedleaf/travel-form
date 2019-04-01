class Wish < ApplicationRecord
    belongs_to :authorization_form
    belongs_to :expense_type
    
    validates :cost, :authorization_form, :expense_type_id, :request_id,presence: true
    validates :cost, numericality: {greater_than_or_equal_to: 0.01}

end
