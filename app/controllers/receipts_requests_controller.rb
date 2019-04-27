class ReceiptsRequestsController < ApplicationController
  before_action :set_receipts_request, only: [:show, :edit, :update, :destroy]

  # GET /receipts_requests
  # GET /receipts_requests.json
  def index
    @receipts_requests = ReceiptsRequest.all
  end

  # GET /receipts_requests/1
  # GET /receipts_requests/1.json
  def show
    @receipts = @receipts_request.receipts
  end

  # GET /receipts_requests/new
  def new
    @receipts_request = ReceiptsRequest.new
    @status_id = Status.where(name: "Pending").take.id
    @receipts_request.receipts.build
    
  end

  # GET /receipts_requests/1/edit
  def edit
  end

  # POST /receipts_requests
  # POST /receipts_requests.json
  def create
    @receipts_request = ReceiptsRequest.new(receipts_request_params)
    
    
    
    respond_to do |format|
      if @receipts_request.save
        format.html { redirect_to @receipts_request, notice: 'Receipts request was successfully created.' }
        format.json { render :show, status: :created, location: @receipts_request }
      else
        format.html { render :new }
        format.json { render json: @receipts_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /receipts_requests/1
  # PATCH/PUT /receipts_requests/1.json
  def update
    respond_to do |format|
      if @receipts_request.update(receipts_request_params)
        format.html { redirect_to @receipts_request, notice: 'Receipts request was successfully updated.' }
        format.json { render :show, status: :ok, location: @receipts_request }
      else
        format.html { render :edit }
        format.json { render json: @receipts_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /receipts_requests/1
  # DELETE /receipts_requests/1.json
  def destroy
    @receipts_request.destroy
    respond_to do |format|
      format.html { redirect_to receipts_requests_url, notice: 'Receipts request was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_receipts_request
      @receipts_request = ReceiptsRequest.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def receipts_request_params
      params.require(:receipts_request).permit(:total_amount, :department_id, :status_id, :reimbursement_form_id,
      receipts_attributes: [:id ,:location,:receipt_date,:expense_type_id,:image_url,:cost,:_destroy])
    end
end
