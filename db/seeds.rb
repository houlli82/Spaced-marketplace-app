# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

puts "creating 5 users"

5.times do
  User.create!(
    email: Faker::Internet.email,
    password: "123456"
  )
end

puts "5 users created"

puts "making 10 spaces"

10.times do
  Space.create!(
    title: Faker::Space.star_cluster,
    location: Faker::Address.city,
    capacity: rand(2..50),
    fee: rand(1..100) * 1000,
    size: Faker::Number.number(digits: 2),
    user_id: User.all.sample[:id]
  )
end

puts "10 spaces created"
