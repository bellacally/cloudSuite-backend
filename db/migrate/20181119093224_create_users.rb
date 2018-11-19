class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :identification
      t.string :payment_method
      t.string :name
      t.string :email
      t.string :phone_number

      t.timestamps
    end
  end
end
