class CampaignsController < ApplicationController
	before_action :set_campaign, only:[:edit, :update, :show, :destroy]
	before_action :set_organization, only:[:edit, :update, :show, :destroy]

	def show_all
		@campaigns = Campaign.all
	end

	def new
		if organization_logged_in?
			@campaign = Campaign.new
		else
			redirect_to organizations_login_path
		end
	end

	def create
		campaign = Campaign.new(name: campaign_params[:name],
														description: campaign_params[:description],
														organization_id: params[:organization_id])

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
		session[:organization] = params[:organization_id]
		session[:campaign] = params[:id]
		if current_donor
			@user_campaign_pledges = current_donor.pledges.where(campaign_id: @campaign)
			@requests = @campaign.requests
			@organization_campaign_pledges = Pledge.where(campaign_id: @campaign)
			@requests = @campaign.requests
		else
			redirect_to donors_login_path
			# (:organization_id => params[:organization_id], :campaign_id => params[:campaign_id])
		end
	end

	def destroy
		@campaign.destroy
		redirect_to organization_campaigns_path(@campaign.organization_id)
	end

	private

	def campaign_params
		params.require(:campaign).permit(:organization_id, :name, :description)
	end

	def set_campaign
		@campaign = Campaign.find(params[:id])
	rescue ActiveRecord::RecordNotFound
		flash[:alert] = "The Campaign you were looking for could not be found."
	end

	def set_organization
		@organization = Organization.find(params[:organization_id])
	rescue ActiveRecord::RecordNotFound
		flash[:alert] = "The Organization you were looking for could not be found."
	end

end
