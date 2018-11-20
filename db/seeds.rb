# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Clearing Up DB"

Jet.delete_all
User.delete_all
Reservation.delete_all
Review.delete_all

puts "Creating New DB for users"

User.create(email: "test@gmail.com", name: "test")

5.times do
  User.create(email: Faker::Internet.email, name: Faker::Internet.username)
end

puts "Created #{User.count} users"

puts "Creating New DB for Jets"
available_start_date = '2018/11/23'
available_end_date = '2020/11/23'
price = ['15', '5', '6', '75'].sample
location = ['SHA', 'PVG', 'NAY', 'ZUH'].sample
category = ['short-range', 'medium-rang', 'long-range'].sample
model = ['Avro RJ70', 'Beechjet 400A', 'Premier 1'].sample
manufactory = ['Boeing', 'Beechcraft', 'Cesna', 'Gulfstream'].sample
capacity_of_passengers = ['4', '8', '16', '12'].sample

7.times do
  j = Jet.new(location: location, model: model, price_jet: price, category: category, manufactory: manufactory, capacity_of_passengers: capacity_of_passengers, available_start_date: available_start_date, available_end_date: available_end_date)
  j.user = User.first
  j.save
end

puts "Created #{Jet.count} Jets"

r = Reservation.new(customized_request: "test", status: "true")
r.user = User.first
r.jet = Jet.first
r.save

puts "Created #{Reservation.count} reservations"

review = Review.new(content: "test", rating: 5)
review.reservation = Reservation.first
review.save

puts "Created #{Review.count} Reviews"
