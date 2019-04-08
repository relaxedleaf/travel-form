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
    @trip.destroy
    respond_to do |format|
      format.html { redirect_to trips_url, notice: 'Trip was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trip
      @trip = Trip.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def trip_params
      params.require(:trip).permit(:destination, :purpose, :date_start, :date_end, :employee_id,
                                   authorization_form_attributes: [:employee_id, :status_id, wishes_attributes: [:expense_type_id, :cost]],
                                   requests_attributes: [:department_id, :amount, :status_id])
    end
    
    def access_control
      if @trip.employee_id != current_employee.id
        redirect_to trips_path
        flash[:danger] = "Access denied!"
      end
    end
end
