require 'spec_helper'

feature 'Donor Sign Up' do

	scenario 'valid sign up' do
		donor = create(:donor)

		visit root_path
		click_link 'Sign Up'
		fill_in 'First Name', with: donor.first_name
		fill_in 'Last Name', with: donor.last_name
		fill_in 'Email', with: donor.email
		fill_in 'Password', with: donor.password_digest
		click_button 'Sign Up'
		expect(current_path).to eq root_path
	end

	scenario 'invalid sign up' do
		donor = create(:donor)

		visit root_path
		click_link 'Sign Up'
		fill_in 'First Name', with: nil
		fill_in 'Last Name', with: donor.last_name
		fill_in 'Email', with: donor.email
		fill_in 'Password', with: nil
		click_button 'Sign Up'
		expect(current_path).to eq users_new_path
	end

end




feature 'Donor Sign In' do

	scenario 'sign in with valid credentials' do
		donor = create(:donor)

		visit root_path
		click_link 'Sign In'
		fill_in 'Email', with: donor.email
		fill_in 'Password', with: donor.password_digest
		click_button 'Sign In'
		expect(current_path).to eq root_path
	end

	scenario 'sign in with invalid credentials' do
		donor = create(:donor)

		visit root_path
		click_link 'Sign In'
		fill_in 'Email', with: donor.email
		fill_in 'Password', with: nil
		click_button 'Sign In'
		expect(current_path).to eq session_path
	end

end

feature 'Donor view actions' do

	scenario 'donor can view all campaigns without logging in' do
		visit root_path
		click_link 'View All Campaigns'
		expect(current_path).to eq #put path
	end

	scenario 'donor can view a specific campaign' do
		visit root_path
		expect(page).to have_content 'New Campaigns'
		first(:link, 'view details').click
		expect(page).to have_content ''
	end

end