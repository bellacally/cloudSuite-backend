json.extract! @user, :identification, :payment_method, :name, :email, :phone_number
json.jets @user.jets do |jet|
  json.reviews jet.reviews do |review|
    json.extract! review, :content, :rating, :photo
  end
end
