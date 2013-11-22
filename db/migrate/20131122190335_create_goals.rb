class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.integer :user_id
      t.boolean :is_private
      t.string :title
      t.text :description
      t.string :status

      t.timestamps
    end
    add_index :goals, :user_id
  end
end
