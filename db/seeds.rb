# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require 'faker'

categories = ["chinese", "italian", "japanese", "french", "belgian"]

puts "Deleting all restaurants"

Restaurant.destroy_all

puts "Creating restaurants"

10.times do
  Restaurant.create(
    name: Faker::Movies::PrincessBride.character,
    address: Faker::Movies::HarryPotter.location,
    phone_number: Faker::PhoneNumber.phone_number_with_country_code,
    category: categories.sample
  )
  puts 'Restaurant created'
end

25.times do
  review = Review.new(
    rating: (0..5).to_a.sample,
    content: Faker::TvShows::DrWho.quote
  )
  review.restaurant = Restaurant.all.sample
  review.save
  puts "Leaving review"
end
