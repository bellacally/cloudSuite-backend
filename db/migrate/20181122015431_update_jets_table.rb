class UpdateJetsTable < ActiveRecord::Migration[5.2]
  def change
    # change_column :table_name, :column_name, :new_type
    change_column :jets, :price_jet, :integer
    change_column :jets, :description, :text
    change_column :jets, :capacity_of_passengers, :integer
    change_column :jets, :available_start_date, :date
    change_column :jets, :available_end_date, :date

    remove_column :jets, :category, :string
  end
end
