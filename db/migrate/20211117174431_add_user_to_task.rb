class AddUserToTask < ActiveRecord::Migration[6.1]
  def change
    change_table :tasks do |t|
      t.integer :user_id, null: true

      t.index :user_id
    end
  end
end
