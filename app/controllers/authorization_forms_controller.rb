class AuthorizationFormsController < ApplicationController
  before_action :set_authorization_form, only: [:show, :edit, :update, :destroy]

  # GET /authorization_forms
  # GET /authorization_forms.json
  def index
    @authorization_forms = AuthorizationForm.all
  end

  # GET /authorization_forms/1
  # GET /authorization_forms/1.json
  def show
  end

  # GET /authorization_forms/new
  def new
    @authorization_form = AuthorizationForm.new
  end

  # GET /authorization_forms/1/edit
  def edit
  end

  # POST /authorization_forms
  # POST /authorization_forms.json
  def create
    @authorization_form = AuthorizationForm.new(authorization_form_params)

    respond_to do |format|
      if @authorization_form.save
        format.html { redirect_to @authorization_form, notice: 'Authorization form was successfully created.' }
        format.json { render :show, status: :created, location: @authorization_form }
      else
        format.html { render :new }
        format.json { render json: @authorization_form.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /authorization_forms/1
  # PATCH/PUT /authorization_forms/1.json
  def update
    respond_to do |format|
      if @authorization_form.update(authorization_form_params)
        format.html { redirect_to @authorization_form, notice: 'Authorization form was successfully updated.' }
        format.json { render :show, status: :ok, location: @authorization_form }
      else
        format.html { render :edit }
        format.json { render json: @authorization_form.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /authorization_forms/1
  # DELETE /authorization_forms/1.json
  def destroy
    @authorization_form.destroy
    respond_to do |format|
      format.html { redirect_to authorization_forms_url, notice: 'Authorization form was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_authorization_form
      @authorization_form = AuthorizationForm.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def authorization_form_params
      params.require(:authorization_form).permit(:status_id, :employee_id, :trip_id, wishes_attributes: [:expense_type_id, :cost])
    end
end
