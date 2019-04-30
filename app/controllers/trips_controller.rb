class TripsController < ApplicationController
  before_action :set_trip, only: [:show, :edit, :update, :destroy]
  before_action :access_control, only: [:show, :edit, :update, :destroy]

  # GET /trips
  # GET /trips.json
  def index
    @trips = Trip.where("employee_id = " + (current_employee.id.to_s if current_employee))
  end

  # GET /trips/1
  # GET /trips/1.json
  def show
    @wishes = @trip.authorization_form.wishes
    @requests = @trip.requests
  end

  # GET /trips/new
  def new
    @trip = Trip.new
    @status_id = Status.where(name: "Pending").take.id

    # Need to update the pie_chart's data here
    #pie_chart.updateData("?")
    
    @trip.requests.build
    authorization_form = @trip.build_authorization_form
    authorization_form.wishes.build
  end

  # GET /trips/1/edit
  def edit
  end

  # POST /trips
  # POST /trips.json
  def create
    @trip = Trip.new(trip_params)
    @status_id = Status.where(name: "Pending").take.id


    respond_to do |format|
      if @trip.save
        format.html { redirect_to @trip, notice: 'Trip was successfully created.' }
        format.json { render :show, status: :created, location: @trip }
      else
        format.html { render :new }
        format.json { render json: @trip.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /trips/1
  # PATCH/PUT /trips/1.json
  def update
    respond_to do |format|
      if @trip.update(trip_params)
        update_related_attribute
        format.html { redirect_to @trip, notice: 'Trip was successfully updated.' }
        format.json { render :show, status: :ok, location: @trip }
      else
        format.html { render :edit }
        format.json { render json: @trip.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trips/1
  # DELETE /trips/1.json
  def destroy
    error_messages = []
    bullet = '&#8226 '
    @oldRequests = @trip.requests
    respond_to do |format|
      if @trip.destroy
        format.html { redirect_to trips_url }
        flash[:success] = 'Trip was successfully deleted'
        format.json { head :no_content }
      else
        format.html { redirect_to trip_path(@trip)}
        @trip.errors.full_messages.each do |message|
          error_messages.push(bullet + message)
        end
        flash[:danger] = error_messages.join("<br/>")
        format.json { head :no_content }
      end
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trip
      @trip = Trip.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def trip_params
      params.require(:trip).permit(:purpose, :date_start, :date_end, :employee_id,
                                   authorization_form_attributes: [:employee_id, :status_id, wishes_attributes: [:expense_type_id, :cost]],
                                   requests_attributes: [:department_id, :amount, :status_id], destination_attributes: [:country, :state, :city])
    end
    
    def access_control
      if @trip.employee_id != current_employee.id
        redirect_to trips_path
        flash[:danger] = "Access denied!"
      end
    end
    
    def update_related_attribute
      authform = @trip.authorization_form
      authformCurrentStat = authform.status.name
      if authformCurrentStat != "pending"
        pendingStatus_id = Status.where(name: "Pending").take.id
  
        #update authform status
        authform.update_attribute(:status_id, pendingStatus_id)
        #update all the request status
        requests = Request.where(trip_id: @trip.id)
        #update all the department's budget
        requests.each do |request|
          if request.status.name == "Approved"
            request.department.update_attribute(:budget_hold, request.department.budget_hold - request.amount)
          end
        end
        requests.update_all(status_id: pendingStatus_id)
      end
    end
end
