module Api
    class PagesController < ApplicationController  
        def getdestination
            trips = Trip.where("employee_id = " + (current_employee.id.to_s if current_employee))
            
            destinations = []
            
            trips.each do |trip|
              destinations.push(trip.destination)
            end
            
            render json: {data: destinations}
        end
        
        def allstatus
            statuses = Status.all;
            render json: {data: statuses}
        end
    end
end