
class PledgesController < ApplicationController

  def list_donor_pledges
    #list all pledges of a donor
    @pledges = Donor.find(params[:donor_id]).pledges
  end

  def create_pledges
    request = Request.find(pledge_params[:request_id])
    new_request_quantity = request.quantity - pledge_params[:quantity].to_i
    same_item_pledge = current_donor.pledges.find_by item_id: pledge_params[:item_id]

    if same_item_pledge
      new_pledge_quantity = same_item_pledge.quantity + pledge_params[:quantity].to_i
      same_item_pledge.update_attribute('quantity', new_pledge_quantity)
      request.update_attribute(:quantity, new_request_quantity)
      redirect_to organization_campaign_path(params[:organization_id], params[:campaign_id])
    else
      pledge = Pledge.new(quantity: pledge_params[:quantity],
                          item_id: pledge_params[:item_id],
                          campaign_id: params[:campaign_id],
                          donor_id: current_donor.id)

      if pledge.save
        request.update_attribute(:quantity, new_request_quantity)
        redirect_to organization_campaign_path(params[:organization_id], params[:campaign_id])
      else
        flash[:error] = pledge.errors_full_messages
        redirect_to organization_campaign_path(params[:organization_id], params[:campaign_id])
      end
    end
  end

  private

  def pledge_params
    params.require(:pledge).permit(:quantity, :item_id, :request_id)
  end
end
