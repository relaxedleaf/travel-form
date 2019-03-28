class Request < ApplicationRecord
    belongs_to :trip
    belongs_to :department
    
    validates :department_id, :trip_id, :amount, presence: true
    validates :amount, numericality: {greater_than_or_equal_to: 0.01}

end
