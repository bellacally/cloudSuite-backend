class AddAvailableStartDateToJets < ActiveRecord::Migration[5.2]
  def change
    add_column :jets, :available_start_date, :string
  end
end
