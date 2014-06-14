class DonorsController < ApplicationController
	def new
	end

	def create
	end

	def edit
	end

	def update
	end

	def show
		@donor = Donor.find(params[:id])
	end

	def destroy
	end

	
end