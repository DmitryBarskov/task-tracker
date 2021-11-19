class AddUserToTask < ActiveRecord::Migration[6.1]
  def change
    change_table :tasks do |t|
      t.integer :user_id, null: true
      t.index :user_id
      add_reference :users, :task
    end
  end
end
