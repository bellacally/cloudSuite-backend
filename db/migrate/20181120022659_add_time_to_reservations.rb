class AddTimeToReservations < ActiveRecord::Migration[5.2]
  def change
    add_column :reservations, :start_time, :integer
    add_column :reservations, :end_time, :integer
  end
end
