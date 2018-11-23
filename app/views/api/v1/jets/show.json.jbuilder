json.extract! @jet, :id, :avatarurl, :price_jet, :location, :model, :photo, :description, :capacity_of_passengers, :manufactory, :user_id, :available_start_date, :available_end_date
json.reviews @jet.reviews do |review|
  json.extract! review, :id, :content, :rating, :reservation_id
end
