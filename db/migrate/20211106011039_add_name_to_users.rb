class AddNameToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :name, :string
    add_column :users, :surname, :string
    add_index :users, :email,                unique: true
    add_index :users, :reset_password_token, unique: true
  end
end
