class CampaignsController < ApplicationController

	def show_all
		@campaigns = Campaign.all
	end

	def index
		@organization_campaigns = Organization.find(params[:organization_id]).campaigns
	end

	def new
		@campaign = Campaign.new
	end

	def create
		campaign = Campaign.new(campaign_params)

		if campaign.save
			redirect_to organization_campaign_path(params[:organization_id], campaign)
		else
			flash[:alert] = "Problem creating new campaign."
			render 'new'
		end
	end

	def edit
		@campaign = Campaign.find(params[:id])
	end

	def update
		p params
		@campaign = Campaign.find(params[:id])
		@campaign.update_attributes(campaign_params)
		p @campaign.errors.full_messages
		redirect_to organization_campaign_path
	end

	def show
	end

	def destroy
	end

	private

	def campaign_params
		params.require(:campaign).permit(:organization_id, :name, :description, :start_date, :end_date)
	end

end
