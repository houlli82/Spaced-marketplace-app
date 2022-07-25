# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

puts "Destroying all bookings"
Booking.destroy_all
puts "Destroying all spaces"
Space.destroy_all
puts "Destroying all users"
User.destroy_all

puts "creating 5 users"

# User.create!(
#   email: "dev@email.com",
#   password: "123123"
# )

5.times do
  User.create!(
    email: Faker::Internet.email,
    password: "123456"
  )
end

placeImage = [
  "https://i.pinimg.com/originals/a3/63/ce/a363ce996e0cedd9ae100c236bbf92d9.jpg",
  "http://madonart.com/wp-content/uploads/2015/01/P1000366.jpg",
  "https://i.pinimg.com/564x/b5/5a/b6/b55ab6ea74a8b5989c13f5724a799f5e.jpg",
  "https://i.pinimg.com/564x/00/bd/45/00bd455c1786c0f487f0bc134ed97f7a.jpg",
  "https://i.pinimg.com/564x/90/63/85/90638575b0a94a5967827c69580cfb26.jpg",
  "https://i.pinimg.com/564x/a5/84/ac/a584acae05302eadbd575359139e3ac3.jpg",
  "https://i.pinimg.com/originals/ff/e1/c2/ffe1c2e86b683b0e57b3599c1a103173.gif"
]

puts "5 users created"
puts "making 20 spaces"

20.times do
  user_ids = User.all.pluck(:id)
  s = Space.create!(
    title: Faker::Space.star_cluster,
    location: Faker::Address.city,
    image: placeImage.sample,
    capacity: rand(2..50),
    fee: rand(1..100) * 1000,
    size: Faker::Number.number(digits: 2),
    user_id: user_ids.sample,
  )
  b = Booking.create!(
    space_id: s.id,
    user_id: user_ids.reject { |id| id == s.user_id}.sample,
    from: Time.now.getutc,
    to: Time.now.getutc + 1000000
  )
end
puts "20 spaces created"
