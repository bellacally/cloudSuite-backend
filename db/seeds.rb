# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

put "Clearing Up DB"
Jet.destory_all

put "Creating New DB for Jets"

      price = ['15','5','6','75'].sample
      location = ['SHA','PVG','NAY','ZUH'].sapmle
      category = ['short-range','medium-rang','long-range'].sapmle
      model = ['Avro RJ70', 'Beechjet 400A', 'Premier 1'].sapmle
      manufactory = ['Boeing', 'Beechcraft', 'Cesna', 'Gulfstream'].sapmle
      capacity_of_passengers = ['4', '8', '16', '12'].sapmle

5.times do
  Jet.create(location: location, model: model, price_jet: price, category: category, manufactory: manufactory, capacity_of_passengers: capacity_of_passengers)
end

puts "Created #{Jet.count} Jets"
