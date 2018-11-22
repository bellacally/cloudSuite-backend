class Reservation < ApplicationRecord
  belongs_to :jet
  belongs_to :user
  has_many :reviews

  def done?
    if self.end_date < Time.now

  end
end
