# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Clearing Up DB"
Review.delete_all
Reservation.delete_all
Jet.delete_all
User.delete_all

puts "Creating New DB for users"
User.create(email: "test@gmail.com", name: "test")


10.times do
  available_start_date = '2018/11/23'
  available_end_date = '2020/11/23'
  price = ['15', '5', '6', '75', '50', '60', '18', '22', '44'].sample
  location = ['Beijing China Airport', 'Beijing Nanyuan Airport', 'Shenzhen Bao’an International', 'Zhuhai Jinwan Airport', 'Shenzhen Bao’an International', 'Hong Kong International', 'Shanghai Hongqiao International', 'Shanghai Pudong International', 'Hangzhou Xiaoshan International',
  'Lijian Sanyi Airport', ' Guangzhou Baiyun International', 'Macau International'].sample
  model = ['Avro RJ70', 'Beechjet 400A', 'Premier 1'].sample
  manufactory = ['Boeing', 'Beechcraft', 'Cesna', 'Gulfstream'].sample
  capacity_of_passengers = ['4', '8', '16', '12'].sample
  rating = [1, 2, 3, 4, 5].sample

  user = User.create(email: Faker::Internet.email, name: Faker::Internet.username)
  jet = Jet.new(location: location, model: model, price_jet: price, manufactory: manufactory, capacity_of_passengers: capacity_of_passengers, available_start_date: available_start_date, available_end_date: available_end_date)
  jet.user = user
  jet.save
  reservation = Reservation.new(customized_request: Faker::HarryPotter.quote, status: "true")
  reservation.user = user
  reservation.jet = jet
  reservation.save
  review = Review.new(content: Faker::Coffee.notes, rating: rating)
  review.reservation = reservation
  review.save
end
puts "Created #{User.count} users"
puts "Created #{Jet.count} Jets"
puts "Created #{Reservation.count} reservations"
puts "Created #{Review.count} Reviews"


