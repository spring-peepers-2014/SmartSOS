class RequestsController < ApplicationController
  before_action :set_campaign, only:[:create, :make_requests, :edit_requests, :update, :make_requests, :destroy]
  before_action :set_request, only:[:update, :destroy]
  before_action :set_organization, only:[:make_requests, :destroy]

  def make_requests
    #forms for making requests
    @items = Item.all
    @total_request_price = @campaign.total_requests_price
  end

  def create
    @request = Request.new(request_params)

    if @request.save
      flash[:notice] = "Item added"
      redirect_to  make_requests_path(@campaign.organization, @campaign)
    else
      flash[:alert] = "#{@request.errors.full_messages}"
      redirect_to  make_requests_path(@campaign.organization, @campaign)
    end
  end

  def edit_requests
    @requests = @campaign.requests
  end

  def update
    if @request.update(request_params)
      render :edit_requests
    else
      flash[:alert] = "Request quantity can't be zero."
      render :edit_requests
    end
  end

  def destroy
    if @request.destroy
      flash[:alert] = "Success. Your Request has been removed."
      redirect_to  make_requests_path(@campaign.organization, @campaign)
    else
      flash[:alert] = "Something went terribly wrong. Request not destroyed."
      render :edit_requests
    end
  end

  private

  def request_params
    params.require(:request).permit(:campaign_id, :item_id, :quantity)
  end

  def set_campaign
    @campaign = Campaign.find(params[:campaign_id])
  rescue ActiveRecord::RecordNotFound
    flash[:alert] = "The campaign you were looking for could not be found."
  end

  def set_request
    @request = Request.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:alert] = "The request you were looking for could not be found."
  end

  def set_organization
    @organization = Request.find(params[:organization_id])
  rescue ActiveRecord::RecordNotFound
    flash[:alert] = "The Organization you were looking for could not be found."
  end



end
