module Api
    class PagesController < ApplicationController  
        def getdestination
            destinations = Trip.where("employee_id = " + (current_employee.id.to_s if current_employee)).select(:id, :destination)
            render json: {data: destinations}
        end
    end
end