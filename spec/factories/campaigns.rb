require 'faker'

FactoryGirl.define do
	factory :campaign do
    association :organization
		name { Faker::Lorem.word }
		description { Faker::Lorem.paragraph }
		start_date { '02-06-2014' }
		end_date { '02-10-2014' }

		factory :invalid_campaign do
			name nil
		end

	end

end
