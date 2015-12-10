class RoomTypeRatesController < ApplicationController
  before_action :set_room_type_rate, only: [:show, :edit, :update, :destroy]

  # GET /room_type_rates
  # GET /room_type_rates.json
  def index
    @room_type_rates = RoomTypeRate.all
  end

  # GET /room_type_rates/1
  # GET /room_type_rates/1.json
  def show
  end

  # GET /room_type_rates/new
  def new
    @room_type_rate = RoomTypeRate.new
  end

  # GET /room_type_rates/1/edit
  def edit
  end

  # POST /room_type_rates
  # POST /room_type_rates.json
  def create
    @room_type_rate = RoomTypeRate.new(room_type_rate_params)

    respond_to do |format|
      if @room_type_rate.save
        format.html { redirect_to @room_type_rate, notice: 'Room type rate was successfully created.' }
        format.json { render :show, status: :created, location: @room_type_rate }
      else
        format.html { render :new }
        format.json { render json: @room_type_rate.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /room_type_rates/1
  # PATCH/PUT /room_type_rates/1.json
  def update
    respond_to do |format|
      if @room_type_rate.update(room_type_rate_params)
        format.html { redirect_to @room_type_rate, notice: 'Room type rate was successfully updated.' }
        format.json { render :show, status: :ok, location: @room_type_rate }
      else
        format.html { render :edit }
        format.json { render json: @room_type_rate.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /room_type_rates/1
  # DELETE /room_type_rates/1.json
  def destroy
    @room_type_rate.destroy
    respond_to do |format|
      format.html { redirect_to room_type_rates_url, notice: 'Room type rate was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_room_type_rate
      @room_type_rate = RoomTypeRate.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def room_type_rate_params
      params.require(:room_type_rate).permit(:room_type_id, :on_date, :rate)
    end
end
