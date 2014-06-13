require 'faker'

FactoryGirl.define do 
	factory :campaign do 
		name { Faker::Name.last_name }
		email { Faker::Internet.email }
	end

	factory :invalid_campaign do 
		name { nil }
		email { Faker::Internet.email }
	end
end
