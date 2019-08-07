class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :username
      t.string :password_digest
      t.string :phone_number
      t.boolean :verified, :default => 0

      t.timestamps
    end
    add_index :users, :username, unique: true
    add_index :users, :phone_number, unique: true
  end
end
