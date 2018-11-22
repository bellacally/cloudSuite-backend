class UpdateReviewsTable < ActiveRecord::Migration[5.2]
  def change
    change_column :reviews, :content, :text
    remove_column :reviews, :photo, :string
  end
end
