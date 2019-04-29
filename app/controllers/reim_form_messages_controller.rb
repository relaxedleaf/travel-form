class ReimFormMessagesController < ApplicationController
  before_action :set_reim_form_message, only: [:show, :edit, :update, :destroy]

  # GET /reim_form_messages
  # GET /reim_form_messages.json
  def index
    @reim_form_messages = ReimFormMessage.all
  end

  # GET /reim_form_messages/1
  # GET /reim_form_messages/1.json
  def show
  end

  # GET /reim_form_messages/new
  def new
    @reim_form_message = ReimFormMessage.new
  end

  # GET /reim_form_messages/1/edit
  def edit
  end

  # POST /reim_form_messages
  # POST /reim_form_messages.json
  def create
    @reim_form_message = ReimFormMessage.new(reim_form_message_params)

    respond_to do |format|
      if @reim_form_message.save
        format.html { redirect_to @reim_form_message, notice: 'Reim form message was successfully created.' }
        format.json { render :show, status: :created, location: @reim_form_message }
      else
        format.html { render :new }
        format.json { render json: @reim_form_message.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reim_form_messages/1
  # PATCH/PUT /reim_form_messages/1.json
  def update
    respond_to do |format|
      if @reim_form_message.update(reim_form_message_params)
        format.html { redirect_to @reim_form_message, notice: 'Reim form message was successfully updated.' }
        format.json { render :show, status: :ok, location: @reim_form_message }
      else
        format.html { render :edit }
        format.json { render json: @reim_form_message.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reim_form_messages/1
  # DELETE /reim_form_messages/1.json
  def destroy
    @reim_form_message.destroy
    respond_to do |format|
      format.html { redirect_to reim_form_messages_url, notice: 'Reim form message was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reim_form_message
      @reim_form_message = ReimFormMessage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reim_form_message_params
      params.require(:reim_form_message).permit(:reimbusement_form_id, :message, :status_id)
    end
end
