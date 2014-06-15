require 'spec_helper'

describe Campaign do
	context "it should belong to organization" do
		it { should belong_to(:organization) }
	end

	context "it should have many requests" do
		it { should have_many(:requests) }
	end

	# context "it should have many requested_items" do
	# 	it { should have_many(:requested_items).through(:requests).source(:item) }
	# end

	context "it should have many pledges" do
		it { should have_many(:pledges) }
	end

	context "it should have many pledged_items" do
		it { should have_many(:pledged_items).through(:pledges) }
	end

	context "it should have many donors" do
		it { should have_many(:donors).through(:pledges) }
	end

end

