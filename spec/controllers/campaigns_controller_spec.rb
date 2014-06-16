require 'spec_helper'

describe CampaignsController do
  let(:campaign) { create :campaign }

describe 'GET #index' do

    it 'renders campaigns index page' do
      get :index, organization_id: campaign.organization.id
      expect(response).to render_template :index
    end
  end

  describe 'GET #show_all' do
    it 'assigns all campaigns to @campaigns' do
      campaign2 = create(:campaign)
      get :show_all
      expect(assigns(:campaigns)).to match_array([campaign, campaign2])
    end

    it 'renders campaigns show_all page' do
      get :show_all
      expect(response).to render_template :show_all
    end
  end

  describe 'GET #new' do
    it 'assign a new instance of Campaign to @campaign' do
      get :new, organization_id: campaign.organization_id
      expect(assigns(:campaign)).to be_a Campaign
    end
  end

  describe "POST #create" do
    let!(:campaign) { create :campaign }

    it 'with valid attributes' do
      expect{
        post :create, organization_id: campaign.organization_id, campaign: attributes_for(:campaign)
        }.to change(Campaign, :count).by(1)
    end

    it 'with invalid attributes' do
      expect{
        post :create, organization_id: campaign.organization_id, campaign: attributes_for(:invalid_campaign)
        }.to_not change(Campaign, :count)
    end
  end

  describe 'GET #edit' do
    it 'assigns @campaign to requested record of Campaign' do
      get :edit, organization_id: campaign.organization.id, id: campaign.id
      expect(assigns(:campaign)).to eq campaign
    end

    it 'renders edit page' do
      get :edit, organization_id: campaign.organization.id, id: campaign.id
      expect(response).to render_template :edit
    end
  end

  describe 'POST #update' do
    it 'with valid attributes' do
      campaign = create(:campaign, name: 'Campaign Name')
      patch :update, id: campaign, organization_id: campaign.organization, campaign: attributes_for(:campaign, name: 'Edited Campaign Name')
      campaign.reload
      expect(campaign.name).to eq('Edited Campaign Name')
    end

    it 'with invalid attributes' do
      campaign = create(:campaign, name: 'Campaign Name')
      patch :update, id: campaign, organization_id: campaign.organization, campaign: attributes_for(:campaign, name: '')
      expect(response).to render_template :edit
    end
  end

  describe 'GET #show' do
    let(:donor) { create :donor }
    let(:item) { create :item }
    it 'assigns @user_campaign_pledges to an Array of pledges' do
      session[:donor_id] = donor.id
      pledge1 = Pledge.create(donor_id: donor.id, campaign_id: campaign.id, item_id: item.id)
      pledge2 = Pledge.create(donor_id: donor.id, campaign_id: campaign.id, item_id: item.id)
      get :show, organization_id: campaign.organization, id: campaign
      expect(assigns(:user_campaign_pledges)).to eq [pledge1, pledge2]
    end

    it 'renders campaign show page' do
      session[:donor_id] = donor.id
      get :show, organization_id: campaign.organization, id: campaign
      expect(response).to render_template :show
    end
  end

  describe 'DELETE #destroy' do
    it 'deletes requested campaign' do
      campaign = create(:campaign)
      expect{
        delete :destroy, organization_id: campaign.organization, id: campaign
      }.to change(Campaign, :count).by(-1)
    end

    it 'should redirect to index page' do
      campaign = create(:campaign)
      delete :destroy, organization_id: campaign.organization, id: campaign
      expect(response).to redirect_to organization_campaigns_path(campaign.organization)
    end
  end


end
