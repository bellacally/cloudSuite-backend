class CreateJets < ActiveRecord::Migration[5.2]
  def change
    create_table :jets do |t|
      t.string :available_date
      t.string :price_jet
      t.string :location
      t.string :model
      t.string :photo
      t.string :description
      t.string :capacity_of_passengers
      t.string :category
      t.string :manufactory
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
