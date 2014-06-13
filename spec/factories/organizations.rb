require 'faker'

FactoryGirl.define do 
	factory :org do 
		name { Faker::Name.last_name }
		street { Faker::Address.street_address }
		city { Faker::Address.city }
		state { Faker::Address.state }
		zipcode { Faker::Address.zip }
		email { Faker::Internet.email }
		password { 'password' }
		password_confirmation { 'password' } 
		phone { '1234567890' }
		description { Faker::Lorem.paragraph }
		url { Faker::Internet.url }
	end

	factory :invalid_org do 
		name nil
	end
end
