require 'faker'

FactoryGirl.define do 
	factory :donor do 
		first_name { Faker::Name.first_name }
		last_name { Faker::Name.last_name }
		email { Faker::Internet.email }
		password { "password" }
	end

	factory :invalid_donor do 
		first_name { nil}
		last_name { Faker::Name.last_name }
		email { Faker::Internet.email }
		password { "password" }
	end
end
