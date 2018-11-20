class AddAvailableEndDateToJets < ActiveRecord::Migration[5.2]
  def change
    add_column :jets, :available_end_date, :string
  end
end
