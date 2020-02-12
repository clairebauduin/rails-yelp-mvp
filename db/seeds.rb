# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

Restaurant.destroy_all
Review.destroy_all

puts "Creating 20 restaurant with 3 reviews..."

20.times do
  restaurant = Restaurant.create!(
    name: Faker::Restaurant.name,
    phone_number: Faker::PhoneNumber.phone_number,
    category: ["chinese", "italian", "japanese", "french", "belgian"].sample,
    address: Faker::Address.street_address
    )
  3.times do
    Review.create!(
      content: Faker::Food.description,
      rating: (0..5).to_a.sample,
      restaurant: restaurant
      )
  end
end

puts "Done !"
