require 'spec_helper'

feature 'Creating Organizations' do
	before :each do
		visit '/'
		click_link 'Register Organization'
	end
	
	scenario 'can register a new organization with VALID attributes' do
	end

	scenario 'can NOT register a new organization with INVALID attributes' do
	end

end