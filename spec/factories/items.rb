require 'faker'

FactoryGirl.define do
  factory :item do
    asin { '12DF3FG2AA' }
    name { 'Dog Food' }
    img_url { Faker::Internet.url }
    price { rand(9999) }
  end
end
