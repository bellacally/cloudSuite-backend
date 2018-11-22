class Reservation < ApplicationRecord
  belongs_to :jet
  belongs_to :user
  has_many :reviews

end
