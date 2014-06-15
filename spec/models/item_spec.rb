require 'spec_helper'

describe Item do 

	context "it should have many pledges" do
		it { should have_many(:pledges) }
	end

	context "it should have many requests" do
		it { should have_many(:requests) }
	end

end


