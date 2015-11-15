class ReservationsController < ApplicationController
	before_action :set_reservation_and_guests, only: [:show, :edit, :update, :destroy]

	# GET /reservations
	# GET /reservations.json
	def index
		# List reservations

		# TODO: Redirect if user does not belong to a property

		# Showing reservations based on arrival date
		@arrival_date = Date.today
		if params[:arrival_date].present?
			@arrival_date = Date.parse(params[:arrival_date])
		end
		@reservations = Reservation.where(property_id: current_user.property_id, arrival_date: @arrival_date)		
	end

	# GET /reservations/1
	# set_reservation_and_guests called
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
			# Set the new reservation's dates
			@reservation.arrival_date = Date.parse(params[:arrival_date])
			@reservation.departure_date = Date.parse(params[:departure_date])

			# Save the dates in the cookie
			cookies[:arrival_date] = @reservation.arrival_date
			cookies[:departure_date] = @reservation.departure_date

			# TODO: Check if rooms are left
		end

		# Should be retreived from Price table
		@reservation.rate = 65.00

		@primary_guest = Guest.new
	end

	def dates_lookup
		if cookies[:arrival_date] && cookies[:departure_date]
			# Cookie exists
			@arrival_date = Date.parse(cookies[:arrival_date])
			@departure_date = Date.parse(cookies[:departure_date])
		else
			# Cookie does not exist
			# Set default values
			@arrival_date = Date.today
			@departure_date = @arrival_date + 1

			# Save default values in the cookie
			cookies[:arrival_date] = @arrival_date
			cookies[:departure_date] = @departure_date
		end
	end

	# GET /reservations/1/edit
	# set_reservation_and_guests called
	def edit
	end

	# POST /reservations
	def create
		@reservation = Reservation.new(reservation_params)
		@reservation.property_id = current_user.property_id
		if @reservation.save
			@primary_guest = @reservation.guests.build(guest_params)
			@primary_guest.save
			# TODO: Clear cookies
			# redirect_to property_reservation_path(@reservation.property, @reservation), notice: 'Reservation was successfully created.' 
			redirect_to edit_guest_path(@primary_guest)
			# format.json { render :show, status: :created, location: @reservation }1
		else
			render :new
		end
	end

	# PATCH/PUT /reservations/1
	# PATCH/PUT /reservations/1.json
	# set_reservation_and_guests called
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
	# set_reservation_and_guests called
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
			# TODO: Check if user has access to view the reservation
			# @property = Property.find(params[:property_id])
			@reservation = Reservation.find(params[:id])
			@guests = @reservation.guests

			# TODO: logic for primary guest
			@primary_guest = @guests.first
		end

		# Never trust parameters from the scary internet, only allow the white list through.
		def reservation_params
			params.require(:reservation).permit(:arrival_date, :departure_date, :adults, :children, :room_type_id, :room_id, :rate, :notes)
		end

		def guest_params
			params.require(:guest).permit(:first_name, :last_name)
		end
end
