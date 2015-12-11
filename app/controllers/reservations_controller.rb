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
		# @reservations = Reservation.all
	end

	# GET /reservations/1
	# set_reservation_and_guests called
	def show
	end

	# GET /reservations/new
	# Used in view:
	# @reservation
	# @room_rates - Rate for every room
	# @room_rate_default - Default room rate
	# @room_types
	# @rooms - All available rooms
	def new
		current_property = current_user.property
		# property_id of the new reservation will be set:
		@reservation = current_property.reservations.new

		# Setting default values
		@reservation.arrival_date = Date.today
		@reservation.departure_date = Date.today + 1
		@reservation.adults = 1
		@reservation.children = 0
		@reservation.rate = 1000.00

		# Check if arrival date is in the params
		if params[:arrival_date].present? && params[:departure_date].present?
			# Set the new reservation's dates
			@reservation.arrival_date = Date.parse(params[:arrival_date])
			@reservation.departure_date = Date.parse(params[:departure_date])

			# Save the dates in the cookie
			cookies[:arrival_date] = @reservation.arrival_date
			cookies[:departure_date] = @reservation.departure_date
		end

		@room_types = current_property.room_types

		# TODO: Find Average Price per night for every room
		@room_rates = Hash.new
		current_property.rooms.each do |room|
			# TODO: Find average price

			# Setting it to the price of just the first day

			# Finding the rate from the table
			rtr = room.room_type.room_type_rates.find_by(on_date: @reservation.arrival_date)
			
			if (rtr != nil)
				# Rate was found in the table
				@room_rates[room.id] = rtr.rate
			else
				# Unable to find the rate from the table
				@room_rates[room.id] = 888
			end			
		end

		@rooms = current_property.rooms
		# TODO: Find only available rooms
		# @rooms = Array.new
		current_property.rooms.each do |room|
			if (room.status == :ready)

			end
		end

		@room_rate_default = 777.0		

		# @primary_guest = Guest.new
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
		@reservation.room_type_id = @reservation.room.room_type_id
		if @reservation.save
			# @primary_guest = @reservation.guests.build(guest_params)
			# @primary_guest.save
			# TODO: Clear cookies

			# Create a new transaction for Room Charge
			roomtrans = @reservation.transactions.new
			roomtrans.description = "Room Charge"
			roomtrans.amount = @reservation.rate
			roomtrans.save

			# Create a new transaction for Room Tax
			roomtrans = @reservation.transactions.new
			roomtrans.description = "Room Tax (10%)"
			roomtrans.amount = @reservation.rate * 0.10
			roomtrans.save

			redirect_to reservation_transactions_path(@reservation)

			# redirect_to edit_guest_path(@primary_guest)
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
			# @primary_guest = @guests.first
		end

		# Never trust parameters from the scary internet, only allow the white list through.
		def reservation_params
			rp = params.require(:reservation).permit(:arrival_date, :departure_date, :adults, :children, :room_type_id, :room_id, :rate, :notes)

			# Removing $ and ,
			if (rp["rate"] != nil)
				rp["rate"] = rp["rate"].gsub(/[$,]/, '').to_f
			else
				rp["rate"] = 9999
			end

			return rp
		end

		def guest_params
			params.require(:guest).permit(:first_name, :last_name)
		end
end
