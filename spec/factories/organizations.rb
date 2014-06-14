require 'faker'

FactoryGirl.define do 
	factory :organization do 
		name { Faker::Name.last_name }
		street { Faker::Address.street_address }
		city { Faker::Address.city }
		state { Faker::Address.state }
		zipcode { Faker::Address.zip }
		email { Faker::Internet.email }
		phone '1234567890'
		password_digest 'password'
		description { Faker::Lorem.paragraph }
		url { Faker::Internet.url }

		factory :invalid_organization do 
			name nil
		end
	
	end
end
