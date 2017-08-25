class CreateCloneStory < ActiveRecord::Migration[5.1]
  def change
    create_table :clone_stories do |t|
      t.integer :user_id
      t.integer :story_id
      t.integer :cloned_story_id

      t.timestamps
    end
    add_index :clone_stories, :user_id
    add_index :clone_stories, :story_id
    add_index :clone_stories, :cloned_story_id
    add_index :clone_stories, [:user_id, :story_id]
  end
end
