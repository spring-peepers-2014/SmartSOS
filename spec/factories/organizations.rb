require 'faker'

FactoryGirl.define do 
	factory :organization do 
		name { Faker::Name.last_name }
		street { Faker::Address.street_address }
		city { Faker::Address.city }
		state { Faker::Address.state }
		zipcode { Faker::Address.zip }
		email { Faker::Internet.email }
<<<<<<< HEAD
		phone '1234567890'
		password_digest 'password'
		description { Faker::Lorem.paragraph }
		url { Faker::Internet.url }
=======
		password { 'password' }
		password_confirmation { 'password' } 
		phone { '1234567890' }
		description { Faker::Lorem.paragraph }
		url { Faker::Internet.url }
	end
>>>>>>> development

		factory :invalid_organization do 
			name nil
		end
	
	end
end
