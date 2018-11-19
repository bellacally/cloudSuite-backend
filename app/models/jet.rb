class Jet < ApplicationRecord
  belongs_to :user
  has_many :reservations
  has_many :reviews, through: :reservations
end
