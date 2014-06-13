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
		fill_in 'Phone Number', with:'1234567890'
		fill_in	'Email', with: 'org@example.com'
		fill_in 'Password', with: 'passwrod'
		fill_in 'Password Confirmation', with: 'password'
		fill_in 'Website URL', with: 'orgexample.com'
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
		fill_in 'Phone Number', with: '1234567890'
		fill_in	'Email', with: 'org@example.com'
		fill_in 'Password', with: 'passwrod'
		fill_in 'Password Confirmation', with: 'password'
		fill_in 'Website URL', with: 'orgexample.com'
		click_button 'Register Organization'

		expect(page).to have_content('Apologies. Your Organization has not been registered.')
	end

end

feature 'Editing Organizations' do

	before :each do
		@org = create(:org, name: "Example", password: 'password')
	end

	describe 'Organization Administrators' do
		scenario 'can edit an existing organization' do
			visit '/'
			click_link 'Log In Organization'
			fill_in 'Name', with: 'Example'
			fill_in 'Password', with: 'password'
			click_button 'Login'
			expect(page).to have_content 'Update Organization'
		end
	end

	describe 'Donors' do
		scenario 'can NOT edit an existing organization' do
			visit organization(@org)
			scenario 'can NOT edit an existing organization' do
				expect(page).to have_no_content 'Update Organization'
			end
		end
	end

end