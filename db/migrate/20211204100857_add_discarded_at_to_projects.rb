class AddDiscardedAtToProjects < ActiveRecord::Migration[6.1]
  def change
    add_column :projects, :discarded_at, :datetime, null: true
  end
end
