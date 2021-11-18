class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.string :content
      t.integer :user_id, null: true
      t.integer :task_id, null: true

      t.timestamps
    end
  end
end
