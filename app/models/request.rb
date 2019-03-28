class Request < ApplicationRecord
    belongs_to :trip
    belongs_to :department
end
