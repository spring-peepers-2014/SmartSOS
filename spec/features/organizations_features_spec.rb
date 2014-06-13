require 'spec_helper'

feature 'Creating Organizations' do
	before :each do
		visit '/'
		click_link 'Register Organization'
	end
	
	scenario 'can register a new organization with VALID attributes' do
		fill_in 'Name', with: 'ExampleOrg'
		fill_in 'Description', with: 'this is an example'
		fill_in 'Address', with: '1111 Organization Ave'
		fill_in 'City', with: 'ImagineLand'
		fill_in 'State',with: 'FarAway'
		fill_in 'Zip', with: '10011'
		fill_in 'Phone Number', '1234567890'
		fill_in	'Email', 'org@example.com'
		fill_in 'Password', 'passwrod'
		fill_in 'Password Confirmation', 'password'
		fill_in 'Website URL', 'orgexample.com'
		click_button 'Register Organization'

		org = Organization.where(name: 'ExampleOrg').first

		expect(page.current_url).to eq(organization_url(org))
	end

	scenario 'can NOT register a new organization with INVALID attributes' do
		fill_in 'Name', with: ''
		fill_in 'Description', with: 'this is an example'
		fill_in 'Address', with: '1111 Organization Ave'
		fill_in 'City', with: 'ImagineLand'
		fill_in 'State',with: 'FarAway'
		fill_in 'Zip', with: '10011'
		fill_in 'Phone Number', '1234567890'
		fill_in	'Email', 'org@example.com'
		fill_in 'Password', 'passwrod'
		fill_in 'Password Confirmation', 'password'
		fill_in 'Website URL', 'orgexample.com'
		click_button 'Register Organization'

		expect(page).to have_content('Apologies. Your Organization has not been registered.')
	end

end