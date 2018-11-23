class AddAvatarUrlToJets < ActiveRecord::Migration[5.2]
  def change
    add_column :jets, :avatarurl, :string
  end
end
