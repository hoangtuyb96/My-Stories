class UpdateVotes < ActiveRecord::Migration[5.0]
  def change
    remove_column :votes, :story_id, :integer
    remove_column :votes, :step_id, :integer
    remove_column :votes, :vote_value, :integer

    add_column :votes, :voteable_type, :string
    add_column :votes, :voteable_id, :integer
  end
end
