class WelcomeController < ApplicationController
	def index
	end

	# User will submit property_id and access_code
	def update
		# Do not permit users already belonging to a property to change their property
		if current_user.property
			redirect_to root_url, alert: 'You already belong to a property'
			return
		end
		# Ensure property_id is not blank
		if params[:user][:property_id] == ""
			redirect_to root_url, alert: 'You did not choose a property'
			return
		end
		# Ensure access_code is not blank
		if params[:access_code] == ""
			redirect_to root_url, alert: 'You did not enter an Access Code'
			return
		end

		# Find the property using property_id from params
		p = Property.where(id: params[:user][:property_id].to_i).first
		# Check if property exists
		if p
			# Property exists

			# Check if Access Code is correct
			if (params[:access_code] == "12345")
				# Set the current user's property
				current_user.property_id = p.id
				current_user.save
				redirect_to root_url, notice: 'Successfully enrolled in property ' + current_user.property_id.to_s + " " + current_user.property.name
			else
				# Access code is incorrect
				redirect_to root_url, alert: 'Access Code is incorrect'
				return
			end
		else
			# Property does not exist
			redirect_to root_url, notice: 'Property with id ' + params[:user][:property_id] + ' not found'
		end
	end
end
