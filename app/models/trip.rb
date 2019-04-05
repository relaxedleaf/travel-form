class Trip < ApplicationRecord
    belongs_to :employee
    has_one :reimbursement_form, :dependent => :destroy
    has_one :authorization_form, :dependent => :destroy
    has_many :requests, :dependent => :destroy

    validates :purpose, :destination, :date_start, :date_end, :employee_id, presence: true
    validate :dates_validation
    
    
    accepts_nested_attributes_for :authorization_form
    accepts_nested_attributes_for :requests
    
    private
    
    def dates_validation
        ds = date_start.split('/').map(&:to_i) #date start
        de = date_end.split('/').map(&:to_i) #date end
        if de[2] < ds[2]
            errors.add(:date_end,"can't be ealier than date start")
            throw :abort
        elsif de[0] < ds[0]
            errors.add(:date_end,"can't be ealier than date start")
            throw :abort
        elsif de[1] < ds[1]
            errors.add(:date_end,"can't be ealier than date start")
            throw :abort
        end
    end
end
