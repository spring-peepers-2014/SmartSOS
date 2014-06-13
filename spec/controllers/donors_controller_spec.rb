require 'spec_helper'

descrbe DonorsController do 

	describe 'GET #new' do 
		it "assigns a new Donor to @donor"
		it "renders the :new template"
	end

	describe 'GET #show' do 
		it "assisngs the requested donor to @donor"
			donor = FactoryGirl.build(:donor)
			get :show, id: donor 
			expect(assigns(:donor)).to eq donor
		end
		
		it "renders the :show template" do 
			donor = FactoryGirl.build(:donor)
			get :show, id: donor 
			expect(response).to render_template :show
		end

end