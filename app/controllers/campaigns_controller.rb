class CampaignsController < ApplicationController
	before_action :set_campaign, only:[:edit, :update, :show, :destroy]

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
	end

	def update
		if @campaign.update(campaign_params)
			redirect_to organization_campaign_path(@campaign.organization, @campaign)
		else
			flash[:error] = "#{@campaign.errors.full_messages}"
			render 'edit'
		end
	end

	def show
		# will contain form for user to pledge items
	end

	def destroy
		@campaign.destroy
		redirect_to organization_campaigns_path(@campaign.organization_id)
	end

	private

	def campaign_params
		params.require(:campaign).permit(:organization_id, :name, :description, :start_date, :end_date)
	end

	def set_campaign
		@campaign = Campaign.find(params[:id])
	rescue ActiveRecord::RecordNotFound
		flash[:alert] = "The Organization you were looking for could not be found."
	end

end
