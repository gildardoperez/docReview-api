FactoryGirl.define do
  factory :review do
    review_id { Faker::Number.number(4) }
    rating { Faker::Number.between(1, 5) }
    comment { Faker::MostInterestingManInTheWorld.quote }
  end
end
