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
	end

	describe 'POST #create' do
	end

end