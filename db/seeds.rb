# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Clearing Up DB"

Jet.destroy_all


puts "Creating New DB for users"

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
user_id = ['1', '2', '3', '4', '5'].sample

7.times do
  Jet.create(location: location, model: model, price_jet: price, category: category, manufactory: manufactory, capacity_of_passengers: capacity_of_passengers, available_start_date: available_start_date, available_end_date: available_end_date, user_id: user_id)
end

puts "Created #{Jet.count} Jets"
