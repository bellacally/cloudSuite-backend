json.extract! @user, :identification, :payment_method, :name, :email, :phone_number
json.reservation @user.reservations do |reservation|
  json.extract! reservation, :start_date, :end_date, :total_price
end
json.jets @user.jets do |jet|
  json.reviews jet.reviews do |review|
    json.extract! review, :content, :rating
  end
end
