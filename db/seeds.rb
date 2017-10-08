# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# seed 50 records
20.times do
  doctor = Doctor.create(doctor_id: Faker::Number.number(5), group_id: Faker::Number.number(4), name: Faker::GameOfThrones.character, image: Faker::Avatar.image, address: Faker::Address.street_address, latitude: Faker::Address.latitude, longitude: Faker::Address.longitude )
  rand(0..10).times do
  	doctor.reviews.create(review_id: Faker::Number.number(4), rating: Faker::Number.between(1, 5), comment: Faker::MostInterestingManInTheWorld.quote )
  end
end