class User < ApplicationRecord
  has_many :jets
  has_many :reservations
end
