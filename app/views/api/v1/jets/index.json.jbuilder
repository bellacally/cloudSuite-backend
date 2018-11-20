json.jets do
  json.array! @jets do |jet|
    json.extract! jet, :id, :location, :model, :photo, :description, :capacity_of_passengers, :category, :manufactory, :user_id, :available_start_date, :available_end_date
  end
end

