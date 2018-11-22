class UpdateReservationsTable < ActiveRecord::Migration[5.2]
  def change
    change_column :reservations, :status, :boolean, using: 'status::boolean'
    remove_column :reservations, :start_time, :integer
    remove_column :reservations, :end_time, :integer
    add_column :reservations, :start_time, :time
    add_column :reservations, :end_time, :time
    change_column :reservations, :customized_request, :text
    change_column :reservations, :start_date, :date, using: 'start_date::date'
    change_column :reservations, :end_date, :date, using: 'end_date::date'
    change_column :reservations, :number_of_passengers, :integer, using: 'number_of_passengers::integer'
    change_column :reservations, :total_price, :float, using: 'total_price::float'
  end
end
