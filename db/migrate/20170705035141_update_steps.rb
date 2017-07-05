class UpdateSteps < ActiveRecord::Migration[5.0]
  def change
    remove_column :steps, :vote, :integer
  end
end
