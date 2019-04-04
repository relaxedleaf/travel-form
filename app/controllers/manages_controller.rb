class ManagesController < ApplicationController
    def authform_index
        status_id = Status.where(name: "Pending").take.id
        
        @requests = Request.where(department_id: current_employee.department_id, 
                                  status_id: status_id)
        
        puts "hello"
        puts status_id
        puts @requests
        puts "hello"
    end
    
    def authform_show
        @trip = Trip.find(params[:id])
        @wishes = @trip.authorization_form.wishes
        @requests = @trip.requests
    end
    
    def authform_update
        req = Request.find(params[:id])
        @trip = req.trip
        @authorization_form = @trip.authorization_form
        status_id = params[:status_id]
        req.update_attribute(:status_id, status_id)
        update_authform_status

        
        redirect_to manage_auth_path(@trip), :notice => "Updated successful!"
          
          
    end
    
    private 
        
        def update_authform_status
            statusID = -1
            approved_id = Status.where(name: "Approved").take.id
            p_approved_id = Status.where(name: "Partial Approved").take.id
            pending_id = Status.where(name: "Pending").take.id
            denied_id = Status.where(name: "Denied").take.id
            
            puts "hello"
            
            pb = !Request.where(trip_id: @trip.id, status_id: pending_id).nil? #pb = pending_boolean
            ab = !Request.where(trip_id: @trip.id, status_id: approved_id).nil? #ab = approved_boolean
            db = !Request.where(trip_id: @trip.id, status_id: denied_id).nil? #db = denied_boolean
            
            puts pb
            puts ab
            puts db
            
            if pb && ab
                if db
                    statusID =  p_approved_id
                    @authorization_form.update_attribute(:status_id, statusID)
                end
            end
            
            
        end
end
