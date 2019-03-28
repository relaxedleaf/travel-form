class Employee < ApplicationRecord
    belongs_to :department
    
    has_many :trips
    has_many :authorization_forms
end
