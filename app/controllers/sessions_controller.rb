class SessionsController < ApplicationController

	def organizations_new
	end

	def organizations_create
		if organization = Organization.find_by_name(params[:name])
			if organization.authenticate(params[:password])
				session[:organization_id] = organization.id
				redirect_to organization_path(organization)
			else
				flash.now.alert = "Invalid Password"
				render "new"
			end
		end
	end

	def organizations_destroy
	end

	def donors_new
	end

	def donors_create
	end

	def donors_destroy
	end

end
