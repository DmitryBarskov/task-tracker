class AddUserToTask < ActiveRecord::Migration[6.1]
  def change
    add_column :tasks, :user_id, :integer, null: true
  end
end
