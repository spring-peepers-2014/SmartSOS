require 'faker'

def random_asin
  Array.new(10){rand(36).to_s(36).upcase}.join
end

organization_names = ["Red Cross", "Children's Disaster Services"]
item_names = [ "paper towels",
          "water bottles",
          "tampons",
          "dog food",
          "Sham-wows",
          "blankets",
          "shoes"]


item_names.each do |item|
  Item.create(  asin: random_asin,
                name: item,
                category: Faker::Lorem.word,
                img_url: Faker::Internet.url,
                price: rand(9999))
end


organization_names.each do |org|
  Organization.create(  
                        name: org,
                        street: Faker::Address.street_address,
                        city: Faker::Address.city,
                        state: Faker::Address.state,
                        zipcode: Faker::Address.zip_code,
                        email: Faker::Internet.email,
                        password: "yolo",
                        password_confirmation: "yolo",
                        phone: Faker::PhoneNumber.phone_number,
                        description: Faker::Lorem.paragraph(sentence_count=3),
                        url: Faker::Internet.url)
end

10.times do
  Donor.create( first_name: Faker::Name.first_name,
                last_name: Faker::Name.last_name,
                email: Faker::Internet.email,
                password: "yolo",
                password_confirmation: "yolo")
end

Organization.all.each do |org|
  2.times do
    org.campaigns << Campaign.create(  
                      name: Faker::Lorem.sentence,
                      description: Faker::Lorem.paragraph(sentence_count=3),
                      start_date: '02-06-2014',
                      end_date: '02-10-2014')
  end
end

Campaign.all.each do |campaign|
  10.times do
    Request.create( campaign_id: campaign.id,
                    item_id: Item.all.sample.id,
                    quantity: rand(10))
  end

  10.times do
    Pledge.create(  donor_id: Donor.all.sample.id,
                    campaign_id: Campaign.all.sample.id,
                    item_id: Item.all.sample.id,
                    quantity: rand(10))
  end
end




















