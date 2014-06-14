class SessionsController < ApplicationController

	def organizations_new
	end

	def organizations_create
		if organization = Organization.find_by_email(params[:email])
			if organization.authenticate(params[:password])
				session[:organization_id] = organization.id
				redirect_to organization_path(organization)
			else
				flash.now.alert = 'Invalid Password'
				render 'new_organization'
			end
		else
			flash.now.alert = 'Invalid Organization Name'
			render 'organizations_new'
		end
	end

	def donors_new
	end

	def donors_create
		if donor = Donor.find_by_email(params[:email])
			if donor.authenticate(params[:password])
				session[:donor_id] = donor.id
				redirect_to donor_path(donor)
			else
				flash.now.alert = 'Invalid Password'
				render 'new_donor'
			end
		else
			flash.now.alert = 'Invalid Email'
			render 'donors_new'
		end
	end

	def logout
		reset_session
		flash[:alert] = 'You have successfully logged out.'
		redirect_to root_path
	end

end
