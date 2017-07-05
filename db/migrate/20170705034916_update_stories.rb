class UpdateStories < ActiveRecord::Migration[5.0]
  def change
    remove_column :stories, :vote, :integer
  end
end
