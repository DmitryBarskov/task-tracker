class CreateActivities < ActiveRecord::Migration[6.1]
  def change
    create_table :activities do |t|
      t.string :target_type
      t.integer :target_id
      t.string :kind
      t.integer :user_id, null: false

      t.timestamps
    end
  end
end
