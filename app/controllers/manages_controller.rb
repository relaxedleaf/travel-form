class ManagesController < ApplicationController
    include ApplicationHelper

#**********Manage Auth Form**********#
    def authform_index
        # if check_paymentmanager
        #     status_id = Status.where(name: "Pending Final Approval").take.id
            
        #     @authforms = AuthorizationForm.where(status_id: status_id)
        #     render 'authform_index_payment'

        # else
        
        if check_budget_approver
            status_id = Status.where(name: "Pending").take.id
            @requests = Request.where(department_id: current_employee.department_id, 
                                      status_id: status_id)
        else
            redirect_to dashboard_path
            flash[:danger] = "Access denied!"
        end
        
    end
    
    def authform_show
        @trip = Trip.find(params[:id])
        @wishes = @trip.authorization_form.wishes
        @requests = @trip.requests
        
        @reim_message = ReimFormMessage.where(trip_id: @trip.id,
                                              message: "A")
    end
    

    
    def authform_history
        # if check_paymentmanager
        #     status_ids = []
        #     past_statuses = Status.where.not(name: ["Pending Final Approval", "Pending"])
            
        #     past_statuses.each do |status|
        #         status_ids.push(status.id)
        #     end
            
        #     @authforms = AuthorizationForm.where(status_id: [status_ids])
        #     render 'authform_history_payment'

        # else
        
        if check_budget_approver
            status_ids = []
            past_statuses = Status.where(name: ["Approved", "Denied", "Pending Final Approval", "Partial Approved"])
            past_statuses.each do |status|
                status_ids.push(status.id)
            end
            
            @requests = Request.where(department_id: current_employee.department_id, 
                                      status_id: [status_ids])
        else
            redirect_to dashboard_path
            flash[:danger] = "Access denied!"
        end
    end
    
    def authform_update
        # if PaymentManager.where(employee_ssn: current_employee.ssn).present?
        #     #for payment manager
        #     authorization_form = AuthorizationForm.find(params[:id])
        #     trip = authorization_form.trip
        #     status_id = params[:status_id]
        #     authorization_form.update_attribute(:status_id, status_id)
            
        #     #if the final decision is denied, modify the budget_hold
        #     if status_id = Status.where(name: "Denied").take.id
        #         trip.requests.each do |request|
        #             request.department.update_attribute(:budget_hold, request.department.budget_hold - request.amount)
        #         end
        #     end
            
    
        #     redirect_to manage_auth_path(trip), :notice => "Updated Successfully!"
        # else
            #for budget approver
            req = Request.find(params[:id])
            @trip = req.trip
            @authorization_form = @trip.authorization_form
            status_id = params[:status_id].to_i
            status_denied_id = Status.where(name: 'Denied').take.id.to_i
            department = Department.find(current_employee.department_id)
            @reim_message = ReimFormMessage.where(trip_id: @trip.id,
                                              message: "A")
            
            
            if(@trip.authorization_form)
                @reim_message.first.update_attribute(:status_id, status_id)
            end
            
            if status_id == status_denied_id
                req.update_attribute(:status_id, status_id)
                update_authform_status
                redirect_to manage_auth_path(@trip), :notice => "Updated Successfully!"
            else
                if req.amount <= department.total_budget - department.budget_hold#Compare the request amount and the avaliable budget
                    req.update_attribute(:status_id, status_id)
                    update_authform_status
                    
                    #*****update department budget*****#
                    department.update_attribute(:budget_hold, department.budget_hold + req.amount)
                
                    redirect_to manage_auth_path(@trip), :notice => "Updated Successfully!"
                else
                    redirect_to manage_auth_path(@trip)
                    flash[:danger] = "Update Failed! Your department does not have enough budget"
                end
            end
        # end
    end
    
#**********Manage Reimburse Form**********#
    def reimform_index
        if check_paymentmanager
            status_id = Status.where(name: "Partial Approved").take.id
            
            @reimbursement_form = ReimbursementForm.where(status_id: status_id)
            
            render 'reimform_index_payment'

        else
            status_id = Status.where(name: "Pending").take.id
            @receipts_requests = ReceiptsRequest.where(department_id: current_employee.department_id, 
                                      status_id: status_id)
            
            @reimbursement_form = ReimbursementForm.where(status_id: status_id)
            @trip = Trip.where(id: @reimbursement_form)
            
        end
    end
    
    
    def reimform_show
        status_id = Status.where(name: "Pending").take.id
        @trip = Trip.find(params[:id])
        @reimbursement_form = ReimbursementForm.find(@trip.reimbursement_form.id)
        @receipts_request = ReceiptsRequest.where(department_id: current_employee.department_id, 
                                      status_id: status_id, reimbursement_form_id: @reimbursement_form.id)
                                      
        @receipt = @reimbursement_form.receipts
        @receipts_request_total =0;
        @reim_message = ReimFormMessage.where(trip_id: @trip.id,
                                              message: "R")
    end
    
    def reimform_history
        if check_paymentmanager
            status_ids = []
            past_statuses = Status.where.not(name: ["Pending Final Approval", "Pending"])
            
            past_statuses.each do |status|
                status_ids.push(status.id)
            end
            
            @reimbursement_form = ReimbursementForm.where(status_id: [status_ids])
            render 'reimhform_history_payment'

        else
            status_ids = []
            past_statuses = Status.where(name: ["Approved", "Denied", "Pending Final Approval", "Partial Approved"])
            past_statuses.each do |status|
                status_ids.push(status.id)
            end
            
            @receipts_request = ReceiptsRequest.where(department_id: current_employee.department_id, 
                                      status_id: [status_ids])
                                      
            @reimbursement_form = ReimbursementForm.where(status_id: [status_ids])
        end
    end
    
    def reimform_update
        if PaymentManager.where(employee_ssn: current_employee.ssn).present?
            #for payment manager
            @trip = Trip.find(params[:id])
            @reimbursement_form = @trip.reimbursement_form
            @receipts_requests = ReceiptsRequest.where(reimbursement_form_id: @reimbursement_form.id)
            status_id = params[:status_id]
            @reimbursement_form.update_attribute(:status_id, status_id)
            @reim_message = ReimFormMessage.where(trip_id: @trip.id,
                                                    message: "R")
            
            if(@trip.reimbursement_form)
                @reim_message.first.update_attribute(:status_id, status_id)
            end
            
            #if the final decision is denied, modify the budget_hold
            if status_id = Status.where(name: "Denied").take.id
                @receipts_requests.each do |receipts_request|
                    receipts_request.department.update_attribute(:budget_hold, receipts_request.department.budget_hold - receipts_request.total_amount)
                end
            end
            
            

    
            redirect_to manage_reimform_path(@trip), :notice => "Updated Successfully!"
        else
            #for budget approver
            @trip = Trip.find(params[:id])
            @reimbursement_form = @trip.reimbursement_form
            @receipts_requests = ReceiptsRequest.where(reimbursement_form_id: @reimbursement_form.id,
                                                        department_id: current_employee.department_id)
            status_id = params[:status_id]
    
            department = Department.find(current_employee.department_id)
            
            @reim_message = ReimFormMessage.where(trip_id: @trip.id,
                                                    message: "R")
            #message = @reim_message.first
            if(@trip.reimbursement_form)
                @reim_message.first.update_attribute(:status_id, status_id)
            end
            
            @receipts_requests.each do |receipts_request|
            
                if receipts_request.total_amount <= department.total_budget - department.budget_hold #Compare the request amount and the avaliable budget
                    receipts_request.update_attribute(:status_id, status_id)
                    update_reimburseform_status
                    
                    #*****update department budget*****#
                    department.update_attribute(:budget_hold, department.budget_hold + receipts_request.total_amount)
                
                    redirect_to manage_reimform_path(@trip), :notice => "Updated Successfully!"
                else
                    redirect_to manage_reimform_path(@trip)
                    flash[:danger] = "Update Failed! Your Department Does Not Have Enough Budget"
                end
            end
        end
    end
    
    private 
        #update authorization form status to approve or partial approved if conditions meet
        def update_authform_status
            approved_id = Status.where(name: "Approved").take.id
            p_approved_id = Status.where(name: "Partial Approved").take.id
            pending_id = Status.where(name: "Pending").take.id
            denied_id = Status.where(name: "Denied").take.id
            # pfa_id = Status.where(name: "Pending Final Approval").take.id
            
            ##true means record exists
            pb = !(Request.where(trip_id: @trip.id, status_id: pending_id).empty?) #pb = pending_boolean
            ab = !(Request.where(trip_id: @trip.id, status_id: approved_id).empty?) #ab = approved_boolean
            db = !(Request.where(trip_id: @trip.id, status_id: denied_id).empty?) #db = denied_boolean
            
            @reim_message = ReimFormMessage.where(trip_id: @trip.id,
                                              message: "A")

            if db == false
                #check partial approved condition
                if pb && ab && (db == false)
                    if @authorization_form.id != p_approved_id #update only if the current status is not partial approved already
                        @authorization_form.update_attribute(:status_id, p_approved_id)
                        if(@trip.authorization_form)
                            @reim_message.first.update_attribute(:status_id, p_approved_id)
                        end
                    end
                end
                
                #check approved condition, if all approved, the status will change to Approved
                if (pb == false) && ab && (db == false)
                    @authorization_form.update_attribute(:status_id, approved_id)
                    if(@trip.authorization_form)
                        @reim_message.first.update_attribute(:status_id, approved_id)
                    end
                end
            else
                @authorization_form.update_attribute(:status_id, denied_id)
                if(@trip.authorization_form)
                    @reim_message.first.update_attribute(:status_id, denied_id)
                end
            end
        end
        
        #update reimbursement form status in the reimform_updat action
        def update_reimburseform_status
            
            pending_id = Status.where(name: "Pending").take.id
            denied_id = Status.where(name: "Denied").take.id
            approved_id = Status.where(name: "Approved").take.id
            
            
            p_approved_id = Status.where(name: "Partial Approved").take.id
            pfa_id = Status.where(name: "Pending Final Approval").take.id
            
            ##true means record exists
            pb = !(ReceiptsRequest.where(reimbursement_form_id: @reimbursement_form.id, status_id: pending_id).empty?) #pb = pending_boolean
            ab = !(ReceiptsRequest.where(reimbursement_form_id: @reimbursement_form.id, status_id: approved_id).empty?) #ab = approved_boolean
            db = !(ReceiptsRequest.where(reimbursement_form_id: @reimbursement_form.id, status_id: denied_id).empty?) #db = denied_boolean
        
            @reim_message = ReimFormMessage.where(trip_id: @trip.id, message: "R")
            
            if db == false
                #check partial approved condition
                if pb && ab && (db == false)
                    if @reimbursement_form.id != p_approved_id #update only if the current status is not partial approved already
                        @reimbursement_form.update_attribute(:status_id, p_approved_id)
                        if(@trip.reimbursement_form)
                            @reim_message.first.update_attribute(:status_id, p_approved_id)
                        end

                    end
                end
                
                #check approved condition, if all approved, the status will change to Pending Final Approval
                if (pb == false) && ab && (db == false)
                    @reimbursement_form.update_attribute(:status_id, pfa_id)
                    if(@trip.reimbursement_form)
                        @reim_message.first.update_attribute(:status_id, pfa_id)
                    end

                end
            else
                @reimbursement_form.update_attribute(:status_id, denied_id)
                if(@trip.reimbursement_form)
                    @reim_message.first.update_attribute(:status_id, denied_id)
                end
            end
        end
end
