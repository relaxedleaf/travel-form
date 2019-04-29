class RequestsController < ApplicationController
  before_action :set_request, only: [:show, :edit, :update, :destroy]

  # GET /requests
  # GET /requests.json
  def index
    @requests = Request.all
  end

  # GET /requests/1
  # GET /requests/1.json
  def show
  end

  # GET /requests/new
  def new
    @request = Request.new
    @trip_id = params[:trip_id]
  end

  # GET /requests/1/edit
  def edit
  end

  # POST /requests
  # POST /requests.json
  def create
    @request = Request.new(request_params)

    respond_to do |format|
      if @request.save
        update_related_attribute
        format.html { redirect_to @request.trip, notice: 'Request was successfully created.' }
        format.json { render :show, status: :created, location: @request }
      else
        format.html { render :new }
        format.json { render json: @request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /requests/1
  # PATCH/PUT /requests/1.json
  def update
    @oldRequestAmount = @request.amount
    respond_to do |format|
      if @request.update(request_params)
        update_related_attribute
        format.html { redirect_to @request.trip, notice: 'Request was successfully updated.' }
        format.json { render :show, status: :ok, location: @request }
      else
        format.html { render :edit }
        format.json { render json: @request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /requests/1
  # DELETE /requests/1.json
  def destroy
    error_messages = []
    bullet = '&#8226 '
    @oldRequestAmount = @request.amount
    respond_to do |format|
      if @request.destroy
        update_related_attribute
        format.html { redirect_to trip_path(@request.trip) }
        flash[:success] = 'Request was successfully deleted'
        format.json { head :no_content }
      else
        format.html { redirect_to trip_path(@request.trip)}
        @request.errors.full_messages.each do |message|
          error_messages.push(bullet + message)
        end
        flash[:danger] = error_messages.join("<br/>")
        format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_request
      @request = Request.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def request_params
      params.require(:request).permit(:trip_id, :amount, :department_id, :status_id)
    end

    def update_related_attribute
      authform = @request.trip.authorization_form
      authformCurrentStat = authform.status.name
      if authformCurrentStat != "pending"
        pendingStatus_id = Status.where(name: "Pending").take.id
  
        #update authform status
        authform.update_attribute(:status_id, pendingStatus_id)
        #update all the request status
        requests = Request.where(trip_id: @request.trip.id)
        #update all the department's budget
        requests.each do |request|
          if request.status.name == "Approved"
            if request.id == @request.id
              request.department.update_attribute(:budget_hold, request.department.budget_hold - @oldRequestAmount)
            else
              request.department.update_attribute(:budget_hold, request.department.budget_hold - request.amount)
            end
          end
        end
        requests.update_all(status_id: pendingStatus_id)
      end
    end
end
