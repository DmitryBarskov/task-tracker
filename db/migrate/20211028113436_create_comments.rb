class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.string :content, null: false
      t.integer :user_id, null: false
      t.integer :task_id, null: false

      t.timestamps
    end
  end
end
