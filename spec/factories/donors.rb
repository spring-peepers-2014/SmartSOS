require 'faker'

FactoryGirl.define do 
	factory :donor do 
		x = Faker::Lorem.word
		first_name { Faker::Name.first_name }
		last_name { Faker::Name.last_name }
		email { Faker::Internet.email }
		password { x }
		password_confirmation { x } 
	end

	# factory :invalid_donor do 
	# 	first_name { nil}
	# 	last_name { Faker::Name.last_name }
	# 	email { Faker::Internet.email }
	# 	password_digest { Faker::Lorem.word }
	# end

end
