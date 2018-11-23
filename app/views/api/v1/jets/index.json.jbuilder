json.jets do
  json.array! @jets do |jet|
    json.extract! jet, :id, :price_jet, :location, :model, :photo, :description, :capacity_of_passengers, :manufactory, :user_id, :available_start_date, :available_end_date
  end
end
