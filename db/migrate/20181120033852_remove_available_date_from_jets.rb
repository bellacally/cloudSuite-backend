class RemoveAvailableDateFromJets < ActiveRecord::Migration[5.2]
  def change
    remove_column :jets, :available_date, :string
  end
end
