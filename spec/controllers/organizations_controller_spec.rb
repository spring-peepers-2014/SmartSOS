require 'spec_helper'

describe OrganizationsController do 

	describe 'GET #index' do 
		it 'assigns all organizations to @organizations' do
			org1 = create(:organization)
			org2 = create(:organization)
			get :index
			expect(assigns(:organizations)).to match_array([org1, org2])
		end
	end

	describe 'GET #show' do
		it 'assigns the requested organization to @org' do
			org = create(:organization)
			get :edit, id: org
			expect(assigns(:organization)).to eq org
		end
	end

	describe 'GET #new' do 
		it 'assigns a new organization to @org' do
			get :new
			expect(assigns(:organization)).to be_a_new(Organization)
		end 
	end

	describe 'POST #create' do
		context 'with VALID attributes' do
			it 'saves the new organization in the database' do
				expect {
					post :create, organization: attributes_for(:organization)
				}.to change(Organization, :count).by(1)
			end
		end

		context 'with INVALID attributes' do
			it "does NOT save the new organization in the database" do
				expect {
					raise 'needs to be fixed'
					post :create, organization: attributes_for(:invalid_organization)
				}.to_not change(Organization, :count)
			end
		end
	end

	describe 'GET #edit' do
		it 'assigns the requested organization to @org' do
			org = create(:organization)
			get :edit, id: org
			expect(assigns(:organization)).to eq org
		end
	end


	describe 'PATCH #update' do
		it 'changes the attributes of an organization' do
			org = create(:organization, name: 'exampleName1')
			patch :update, id: org, organization: attributes_for(:organization, name: 'exampleName2' )
			org.reload
			expect(org.name).to eq('exampleName2')
		end
	end

	describe 'DELETE #destroy' do
		it 'deletes an organization' do
			org = create(:organization)
			expect {
				delete :destroy, id: org			
			}.to change(Organization, :count).by(-1)
		end
	end

end