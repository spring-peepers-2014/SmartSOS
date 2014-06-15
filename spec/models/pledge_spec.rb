require 'spec_helper'

describe Pledge do
	context "it should belong to donor" do
		it { should belong_to(:donor) }
	end

	context "it should belong to campaign" do
		it { should belong_to(:campaign) }
	end



end


describe Donor do 
		it "is valid with a first name, lastname, email and password" do 
		donor = FactoryGirl.build(:donor)
		expect(donor).to be_valid
	end

	context "it should have many pledges" do
		it { should have_many(:pledges) }
	end

	context "it should respond to items" do
		it { should have_many(:pledged_items).through(:pledges) }
	end

	context "it should respond to campaigns" do
		it { should have_many(:campaigns).through(:pledges) }
	end
end
