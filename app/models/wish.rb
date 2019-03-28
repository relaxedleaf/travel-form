class Wish < ApplicationRecord
    belongs_to :authorization_form
    belongs_to :expense_type
end
