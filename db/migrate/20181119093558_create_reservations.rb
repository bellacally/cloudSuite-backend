class CreateReservations < ActiveRecord::Migration[5.2]
  def change
    create_table :reservations do |t|
      t.string :customized_request
      t.string :status
      t.string :start_date
      t.string :end_date
      t.string :destination
      t.string :number_of_passengers
      t.string :passenger_identifications
      t.string :total_price
      t.references :user, foreign_key: true
      t.references :jet, foreign_key: true

      t.timestamps
    end
  end
end
