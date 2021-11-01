class AddUserToProject < ActiveRecord::Migration[6.1]
  def change
    add_column :projects, :user_id, :integer, null: true
  end
end
