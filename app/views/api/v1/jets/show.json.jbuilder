json.extract! @jet, :id, :location, :model, :photo, :description, :capacity_of_passengers, :category, :manufactory, :user_id, :available_start_date, :available_end_date
json.reviews @jet.reviews do |review|
  json.extract! review, :id, :content, :rating, :photo, :reservation_id
end
