class ReservationsController < ApplicationController
	before_action :set_reservation_and_guests, only: [:show, :edit, :update, :destroy]

	# GET /reservations
	# GET /reservations.json
	def index
		

		# Prevent users from viewing reservations for other properties
		if (params[:property_id].to_i != current_user.property_id)
			redirect_to property_reservations_path(current_user.property)
		end

		# Do not list all reservations of all properties
		# @reservations = Reservation.all
		# List reservations for only 1 property

		# TODO: List reservations only today
		
		@reservations = Reservation.where(property_id: params[:property_id])
	end

	# GET /reservations/1
	# GET /reservations/1.json
	def show
	end

	# GET /reservations/new
	def new
		# property_id of the new reservation will be set:
		@reservation = current_user.property.reservations.new

		# Setting default values
		@reservation.arrival_date = Date.today
		@reservation.departure_date = Date.today + 1
		@reservation.adults = 1
		@reservation.children = 0

		# Check if arrival date is in the params
		if params[:arrival_date].present? && params[:departure_date].present?
			@reservation.arrival_date = params[:arrival_date]
			@reservation.departure_date = params[:departure_date]

			# TODO: Check if rooms are left
		end

		# Should be retreived from Price table
		@reservation.rate = 65.00

		@primary_guest = Guest.new
	end

	def dates_lookup
	end

	# GET /reservations/1/edit
	def edit
	end

	# POST /reservations
	# POST /reservations.json
	def create
		@reservation = Reservation.new(reservation_params)
		respond_to do |format|
			if @reservation.save
				@primary_guest = @reservation.guests.build(guest_params)
				@primary_guest.save

				format.html { redirect_to property_reservation_path(@reservation.property, @reservation), notice: 'Reservation was successfully created.' }
				format.json { render :show, status: :created, location: @reservation }
			else
				format.html { render :new }
				format.json { render json: @reservation.errors, status: :unprocessable_entity }
			end
		end
	end

	# PATCH/PUT /reservations/1
	# PATCH/PUT /reservations/1.json
	def update
		respond_to do |format|
			if (@reservation.update(reservation_params)) && (@primary_guest.update(guest_params))
				format.html { redirect_to property_reservation_path(@reservation.property, @reservation), notice: 'Reservation was successfully updated.' }
				format.json { render :show, status: :ok, location: @reservation }
			else
				format.html { render :edit }
				format.json { render json: @reservation.errors, status: :unprocessable_entity }
			end
		end
	end

	# DELETE /reservations/1
	# DELETE /reservations/1.json
	def destroy
		@reservation.destroy
		respond_to do |format|
			format.html { redirect_to property_reservations_path(current_user.property), notice: 'Reservation was successfully destroyed.' }
			format.json { head :no_content }
		end
	end

	private
		# Use callbacks to share common setup or constraints between actions.
		def set_reservation_and_guests
			# @property = Property.find(params[:property_id])
			@reservation = Reservation.find(params[:id])
			@guests = @reservation.guests

			# TODO: logic for primary guest
			@primary_guest = @guests.first
		end

		# Never trust parameters from the scary internet, only allow the white list through.
		def reservation_params
			params.require(:reservation).permit(:property_id, :arrival_date, :departure_date, :adults, :children, :room_type_id, :room_id, :rate, :notes)
		end

		def guest_params
			params.require(:guest).permit(:first_name, :last_name)
		end
end
