class WelcomeController < ApplicationController
	def index
	end

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
		# Find the property using property_id from params
		p = Property.where(id: params[:user][:property_id].to_i).first
		# Check if property exists
		if p
			# Property exists

			# Set the current user's property
			current_user.property_id = p.id
			current_user.save

			# current_user.update(params.require(:user).permit(:firstname, :property_id))

			redirect_to root_url, notice: 'Successfully enrolled in property ' + current_user.property_id.to_s + " " + current_user.property.name

		else
			# Property does not exist
			redirect_to root_url, notice: 'Property with id ' + params[:user][:property_id] + ' not found'
		end
	end
end
