class AddUserToTask < ActiveRecord::Migration[6.1]
  def down
    change_table :tasks do |table|
      table.integer :user_id, null: true

      table.index :user_id
    end
  end
end
