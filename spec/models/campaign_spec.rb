require 'spec_helper'

describe Campaign do
	context "it should belong to organization" do
		it { should belong_to(:organization) }
	end

	context "it should have many requests" do
		it { should have_many(:requests) }
	end

	context "it should have many requested_items" do
		it { should have_many(:requested_items).through(:requests) }
	end

	context "it should have many pledges" do
		it { should have_many(:pledges) }
	end

	# context "it should have many requests" do
	# 	it { should have_many(:requests) }
	# end

	# context "it should have many requests" do
	# 	it { should have_many(:requests) }
	# end

end


  # belongs_to :organization
  # has_many :requests
  # has_many :requested_items, through: :requests, source: :item
  # has_many :pledges
  # has_many :pledged_items, through: :pledges, source: :pledged_item
  # has_many :donors, through: :pledges