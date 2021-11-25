# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

Quotes = ["Classic yacht Moonbeam of Fife III has an array of charter-focused amenities to ensure a memorable experience onboard whatever the destination.", "The 73.6m/2416 expedition yacht Naia (ex. Pegaso) by the Spanish Freire Shipyard offers flexible accommodation for up to 12 guests in 8 cabins and features interior styling by British designer Mark Berryman Design."]

puts "Destroying boats"
Boat.destroy_all
puts "Boats destroyed"

puts "Destroying users"
User.destroy_all
puts "Users destroyed"

##1.time do |user|
##  User.create!(
##   email: test@test.com
##  )
##end

puts "Creating users"
User.create!(
  name: "Raul",
  email: "raul@test.com",
  password: "123456",
  name: "Raul"
)
User.create!(
  name: "Denise",
  email: "denise@test.com",
  password: "123456",
  name: "Denise"
)
User.create!(
  name: "Felix",
  email: "felix@test.com",
  password: "123456",
  name: "Felix"
)
User.create!(
  name: "Isabelle",
  email: "isabelle@test.com",
  password: "123456",
  name: "Isabelle"
)
puts "Users created"

5.times do
  User.create!(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: Faker::Internet.password,
    name: Faker::Name.name_with_middle
  )
end

puts "Creating boats"
locations = ["Marina de Albufeira", "Porto de Aveiro", "Deportivo Del Guadiana Marina", "Doca De Alcantara Marina"]
users = User.all
users.each do |user|
  rand(5..10).times do
    Boat.create!(
      user: user,
      title: Faker::Name.name,
      location: locations[rand(0...locations.length)],
      description: Quotes.sample,
      price_per_day: Faker::Number.decimal(l_digits: 3)
    )
  end
end
puts "Boats created"

## use this for bookings: status: %w[available unavailable].sample
