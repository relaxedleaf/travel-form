class Department < ApplicationRecord
    has_many :employees
    has_many :requests, :dependent => :destroy
    
    validates :name, :manager_ssn, :total_budget, presence: true
    validates :name, uniqueness: true
end
