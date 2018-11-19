class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.string :content
      t.string :rating
      t.string :photo
      t.references :reservation, foreign_key: true

      t.timestamps
    end
  end
end
