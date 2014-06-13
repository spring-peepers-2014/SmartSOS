class OrganizationsController < ApplicationController

	def index
		@organizations = Organization.all
	end

	def new
		@organization = Organization.new
	end	

	def create
		@organization = Organization.new

		if @organization.save
			redirect organization_path(@org)
		else
			flash[:alert] = "Apologies. Your Organization has not been registered."
			render 'new'
		end
	end

	def edit
	end

	def update
	end

	def show
	end

	def destroy
		@organization = Organization.find(params)
		flash[:alert] = "Success. Your Organization has been removed."
		redirect_to root_path
	end

	private

	def organization_params
		params.require(:organization).permit(:name, :street, :city, :state, :zipcode, :email, :phone, :description, :password_digest, :url)
	end

	def set_organization
		@organization = Organization.find(params[:id])
	rescue ActiveRecord::RecordNotFound
		flash[:alert] = "The Organization you were looking for could not be found."
	end
end
