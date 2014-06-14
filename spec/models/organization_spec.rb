require 'spec_helper'

describe Organization do

  context 'associations' do
  	let(:organization){create(:organization)}
  	it { should have_many :campaigns }
  end

end
