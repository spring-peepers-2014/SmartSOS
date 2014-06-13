require 'spec_helper'

descrbe DonorsController do 

	describe 'GET #new' do 
		it "assigns a new Donor to @donor" do 
			get :new
			expect(assigns(:donor)) to be_a_new(Donor)
		end

		it "renders the :new template" do 
			get :new
			expect(:response).to render_template :new
		end
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


		describe 'GET #edit' do 
			it "assigns the requested donor to @donor" do 
				donor = FactoryGirl.build(:donor)
				get :edit, id: donor 
				expect(assigns(:donor)).to eq donor
			end

			it "renders the :edit template" do 
				donor = FactoryGirl.build(:donor) 
				get :edit, id: donor
				expect(response).to render_template :edit
			end
		end




end