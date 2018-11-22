json.extract! @user, :identification, :payment_method, :name, :email, :phone_number
json.reservation_trip @user.reservations do |reservation|
  json.extract! reservation.jet, :model
  json.extract! reservation, :start_date, :end_date, :total_price
end
json.jets @user.jets do |jet|
  json.extract! jet, :model
  json.reservation_plane jet.reservations do |reservation|
    json.extract! reservation, :start_date, :end_date, :total_price
    json.reviews reservation.reviews do |review|
      json.extract! review, :content, :rating
    end
  end
end
