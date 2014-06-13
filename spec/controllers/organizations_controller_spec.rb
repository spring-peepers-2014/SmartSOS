require 'spec_helper'

describe OrganizationsController do 

	describe 'GET #index' do 
		it 'assigns all organziations to @organizations' do
			org1 = create(:org)
			org2 = create(:org)
			get :index
			expect(assigns(:orgs)).to match_array([org1, org2])
		end
	end

	describe 'GET #new' do 
		it 'assigns a new Organization to @org' do
			get :new
			expect(assigns(:org)).to be_a_new(Organization)
		end
	end

	describe 'POST #create' do
		context 'with VALID attributes' do
			it 'saves the new organization in the database' do
				expect {
					post :create, org: create.attributes_for(:org)
				}.to change(Organization, :count).by(1)
			end
		end

		context 'with INVALID attributes' do
			it "does NOT save the new organization in the database" do
				expect {
					post :create, org: create.attributes_for(:invalid_org)
				}.to_not change(Organization, :count)
			end
		end
	end

end