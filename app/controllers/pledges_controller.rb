
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
    #batch-create pledges
    #not implemented yet because unclear of how pledges will be created (-pei)
  end

  private

  def pledge_params
    params.require(:pledge).permit(:organization_id, :campaign_id, :donor_id, :quantity)
  end
end
