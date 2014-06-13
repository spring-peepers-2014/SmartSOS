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

	describe 'POST #create' do 

		context "with valid attributes" do 
			it "saves the new donor in the database" do 
				donor = FactoryGirl.build(:donor)
				expect{
					post :create, donor: attributes_for(donor)
			}.to change(Donor, :donor).by(1)
			end

			it "redirect to donors#show" do 
			end
		end

		context "with invalid attributes" do 
			it "does not save the new donor in the database" do 
				expect {
					post :create,
						donor: attributes_for(FactoryGirl.build(:invalid_donor))
				}.to_not change(Donor, :donor)
			end

			it "re-renders the :new template" do 
				post :create,
					donor: attributes_for(FactoryGirl.build(:invalid_donor))
					expect(response).to render_template :new 
			end
		end

		describe 'PATCH #update' do 
			before :each do 
				@donor = FactoryGirl.create(:donor)
			end

			context "valid attributes" do 
				it "locates the requested @donor" do 
					patch :update, id: @donor, donor: attributes_for(:donor)
					expect(assigns(:donor)).to eq(@donor)
				end

				it "changes @donor's attributes" do 
					patch :update, id: @donor,
						donor: attributes_for(:donor,
							first_name: "Payam",
							last_name: "Pakmanesh",
							email: "p.Pakmanesh@gmail.com",
							password: "password")
						@donor.reload
						expect(@donor.first_name).to eq("Payam")
						expect(@donor.first_name).to eq("Pakmanesh")
				end

				it "redirects to the updated donor" do 
					patch :update, id: @donor, donor: attributes_for(:donor)
					expect(response).to redirect_to @donor
				end
			end
		end 

		describe 'POST #destroy' do 
			before :each do 
				@donor = FactoryGirl.create(:donor)
			end

			it "deletes the donor" do 
				expect{
					delete :destroy, :id: @donor 
				}.to change(Donor, :donor).by(-1)
			end

			it "redirects to home page" do 
				delete :destroy, id: @donor 
				expect(response).to redirect_to root_path
			end
		end

end 



