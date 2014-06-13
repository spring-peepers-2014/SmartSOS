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
	end
end
