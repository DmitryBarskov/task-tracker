class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    enable_extension "citext"

    create_table :users do |t|
      t.citext :email, null: false
      t.string :password_digest
      t.string :full_name

      t.timestamps
    end
    add_index :users, :email, unique: true
  end
end
