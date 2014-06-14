require 'spec_helper'

describe CampaignsController do
  let(:campaign) { create :campaign }
# let!(:organization) { create :organization }

describe 'GET #index' do
  it 'assigns all campaigns of the organization to @organization_campaigns' do
      # campaign = create(:campaign)
      get :index, organization_id: campaign.organization.id
      expect(assigns(:organization_campaigns)).to match_array([campaign])
    end

    it 'renders campaigns index page' do
      # campaign = create(:campaign)
      get :index, organization_id: campaign.organization.id
      expect(response).to render_template :index
    end
  end

  describe 'GET #show_all' do
    it 'assigns all campaigns to @campaigns' do
      # campaign1 = create(:campaign)
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


end
