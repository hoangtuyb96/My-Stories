class CreateStories < ActiveRecord::Migration[5.1]
  def change
    create_table :stories do |t|
      t.string :name
      t.text :description
      t.integer :total_vote
      t.integer :number_of_steps
      t.boolean :is_public
      t.datetime :due_date
      t.integer :user_id
      t.integer :category_id

      t.timestamps
    end
    add_index :stories, :user_id
    add_index :stories, :category_id
  end
end
