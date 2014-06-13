require 'faker'

FactoryGirl.define do 
	factory :organization do 
		name { Faker::Name.last_name }
		email { Faker::Internet.email }
	end

	factory :invalid_organization do 
		name { nil }
		email { Faker::Internet.email }
	end
end
