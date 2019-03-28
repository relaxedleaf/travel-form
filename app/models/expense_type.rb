class ExpenseType < ApplicationRecord
    has_many :wishes
    has_many :receipts
    
    validates :name, presence: true
end
