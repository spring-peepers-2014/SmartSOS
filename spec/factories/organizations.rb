require 'faker'

FactoryGirl.define do 
	factory :org do 
		name { Faker::Name.last_name }
		address { Faker::Address.street_address }
		city { Faker::Address.city }
		state { Faker::Address.state }
		zip { Faker::Address.zip }
		email { Faker::Internet.email }
		phone_number '1234567890'
		password 'password'
		password_confirmation 'password'
		description { Faker::Lorem.paragraph }
		website { Faker::Internet.url }
	end

	factory :invalid_org do 
		name nil
	end
end
