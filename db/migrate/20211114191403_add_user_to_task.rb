class AddUserToTask < ActiveRecord::Migration[6.1]
  def change
    change_table :tasks do |table|
      table.bigint :user_id, null: true

      table.index :user_id
    end
  end
end
