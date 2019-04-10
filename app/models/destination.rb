class Destination < ApplicationRecord
  belongs_to :trip
  
  validates :country, :state, :city, presence: true
  
  COUNTRY = ['US','CN']
end
