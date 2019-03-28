class Request < ApplicationRecord
    belongs_to :authorization_form
    belongs_to :department
end
