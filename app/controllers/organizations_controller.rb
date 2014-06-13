class OrganizationsController < ApplicationController

	def index
		@orgs = Organization.all
	end

	def new
		@org = Organization.new
	end

	def create
		@org = Organization.new

		if @org.save
			redirect organization(@org)
		else
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
