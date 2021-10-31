class AddUserToTask < ActiveRecord::Migration[6.1]
  def up
    change_table :tasks do |table|
      table.integer :user_id, null: true

      table.index :user_id
    end
  end
end
