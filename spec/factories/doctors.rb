FactoryGirl.define do
  factory :doctor do
    doctor_id { Faker::Number.number(5) }
    group_id { Faker::Number.number(4) }
    name { Faker::GameOfThrones.character }
    image { Faker::Avatar.image }
    address { Faker::Address.street_address }
    latitude { Faker::Address.latitude }
    longitude { Faker::Address.longitude }
  end
end