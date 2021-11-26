class AddUserToTask < ActiveRecord::Migration[6.1]
  def change
      add_reference :tasks, :user
  end
end
