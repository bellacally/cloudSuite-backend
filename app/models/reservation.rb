class Reservation < ApplicationRecord
  belongs_to :jet
  belongs_to :user
  has_many :reviews

  def done?
    if self.end_date.present?
      if self.end_date < Time.now
        self.status = true
      else
        self.status = false
      end
    end
  end
end
