require 'spec_helper'

feature 'Donor Sign Up' do

	scenario 'valid sign up' do
		donor = create(:donor)

		visit root_path
		click_link 'Make A Pledge'
		click_link 'Register New Donor'
		fill_in 'First Name', with: donor.first_name
		fill_in 'Last Name', with: donor.last_name
		fill_in 'Email', with: donor.email
		fill_in 'Password', with: donor.password_digest
		click_button 'Register Donor'
		expect(current_path).to eq donor_path(donor)
	end

	scenario 'invalid sign up' do
		donor = create(:donor)

		visit root_path
		click_link 'Make A Pledge'
		click_link 'Register New Donor'
		fill_in 'First Name', with: nil
		fill_in 'Last Name', with: donor.last_name
		fill_in 'Email', with: donor.email
		fill_in 'Password', with: nil
		click_button 'Register Donor'
		expect(page).to have_content 'Apologies. Your Registration was not recorded.'
	end

end




feature 'Donor Sign In' do

	scenario 'sign in with valid credentials' do
		donor = create(:donor)

		visit root_path
		click_link 'Make A Pledge'
		fill_in 'Email', with: donor.email
		fill_in 'Password', with: donor.password_digest
		click_button 'Login'
		expect(current_path).to eq root_path
	end

	scenario 'sign in with invalid credentials' do
		donor = create(:donor)

		visit root_path
		click_link 'Make A Pledge'
		fill_in 'Email', with: donor.email
		fill_in 'Password', with: nil
		click_button 'Login'
		expect(current_path).to eq session_path
	end

end

feature 'Donor view actions' do

	scenario 'donor can view all campaigns without logging in' do
		visit root_path
		click_link 'Browse Campaigns'
		expect(current_path).to eq campaigns_path
	end

	scenario 'donor can view a specific campaign' do
		campaign = create(:campaign, name: "ExampleCampaign")
		visit root_path
		expect(page).to have_content 'Browse Campaigns'
		click_link 'ExampleCampaign'
		expect(page).to have_content 'ExampleCampaign'
	end

end