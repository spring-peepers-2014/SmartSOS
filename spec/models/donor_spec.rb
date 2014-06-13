require 'spec_helper'


describe Donor do 
	
	it "is valid with a first name, lastname, email and password" do 
		donor = FactoryGirl.build(:donor)
		expect(donor).to be_valid
	end

	it "is invalid without first name" do 
		donor = FactoryGirl.build(:invalid_donor)
		expect(donor).to be_invalid
	end

	it "is invalid without last name" 
	it "is invalid without email" 
	it "is invalid without password" 

	context "it should have many pledges" do
		it { should have_many(:pledges) }
	end

	context "it should respond to items" do
		it { should have_many(:items).through(:pledges) }
	end

	context "it should respond to campaigns" do
		it { should have_many(:campaigns).through(:pledges) }
	end



end