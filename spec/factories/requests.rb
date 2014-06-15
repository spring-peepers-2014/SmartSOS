require 'faker'

FactoryGirl.define do
  factory :request do
    association :campaign
    # association :item, factory: :item
    quantity { rand(10) }
  end
end
