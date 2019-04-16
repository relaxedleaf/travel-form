class WishesController < ApplicationController
  before_action :set_wish, only: [:show, :edit, :update, :destroy]

  # GET /wishes
  # GET /wishes.json
  def index
    @wishes = Wish.all
  end

  # GET /wishes/1
  # GET /wishes/1.json
  def show
  end

  # GET /wishes/new
  def new
    @wish = Wish.new
  end

  # GET /wishes/1/edit
  def edit
  end

  # POST /wishes
  # POST /wishes.json
  def create
    @wish = Wish.new(wish_params)

    respond_to do |format|
      if @wish.save
        format.html { redirect_to @wish, notice: 'Wish was successfully created.' }
        format.json { render :show, status: :created, location: @wish }
      else
        format.html { render :new }
        format.json { render json: @wish.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /wishes/1
  # PATCH/PUT /wishes/1.json
  def update
    authform = @wish.authorization_form
    authformCurrentStat = authform.status.name
    pendingStatus_id = Status.where(name: "Pending").take.id

    respond_to do |format|
      if @wish.update(wish_params)
        if authformCurrentStat != "pending"
          authform.update_attribute(:status_id, pendingStatus_id)
        end
        format.html { redirect_to trip_path(@wish.trip), notice: 'Wish was successfully updated.' }
        format.json { render :show, status: :ok, location: @wish }
      else
        format.html { render :edit }
        format.json { render json: @wish.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /wishes/1
  # DELETE /wishes/1.json
  def destroy
    error_messages = []
    bullet = '&#8226 '
    respond_to do |format|
      if @wish.destroy
        format.html { redirect_to trip_path(@wish.authorization_form.trip) }
        flash[:success] = 'Wish was successfully deleted'
        format.json { head :no_content }
      else
        format.html { redirect_to trip_path(@wish.authorization_form.trip)}
        @wish.errors.full_messages.each do |message|
          error_messages.push(bullet + message)
        end
        flash[:danger] = error_messages.join("<br/>")
        format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_wish
      @wish = Wish.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def wish_params
      params.require(:wish).permit(:expense_type_id, :cost, :authorization_form_id)
    end
end
