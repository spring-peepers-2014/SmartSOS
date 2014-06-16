
class PledgesController < ApplicationController


  def index
    #list all pledges for a campaign
    @pledges = Campaign.find(params[:campaign_id]).pledges
  end

  def list_donor_pledges
    #list all pledges of a donor
    @pledges = Donor.find(params[:donor_id]).pledges
  end

  def create_pledges
    pledge = Pledge.new(quantity: pledge_params[:quantity],
                        item_id: pledge_params[:item_id],
                        campaign_id: params[:campaign_id],
                        donor_id: current_donor.id)

    if pledge.save
      request = Request.find(pledge_params[:request_id])
      new_quantity = request.quantity - pledge.quantity
      request.update_attribute(:quantity, new_quantity)
      redirect_to organization_campaign_path(params[:organization_id], params[:campaign_id])
    else
      flash[:error] = pledge.errors_full_messages
      redirect_to organization_campaign_path(params[:organization_id], params[:campaign_id])
    end
  end

  private

  def pledge_params
    params.require(:pledge).permit(:quantity, :item_id, :request_id)
  end
end
