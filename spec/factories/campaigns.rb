require 'faker'

FactoryGirl.define do 
	factory :campaign do 
		name { Faker::Name.last_name }
		description { Faker::Lorem.paragraph }
		# start_date
		# end_date
	end

	factory :invalid_campaign do 
		name nil
	end
end
