require 'rails_helper'

RSpec.describe CloneStory, type: :model do
  describe "ActiveModel validations" do
    it {should validate_presence_of :user}
    it {should validate_presence_of :story}
  end

  describe "ActiveRecord validations" do
    it {should have_db_column(:user_id).of_type :integer}
    it {should have_db_column(:story_id).of_type :integer}
    it {should have_db_column(:cloned_story_id).of_type :integer}
    
    it {should belong_to :user}
    it {should belong_to :story}

    it {should have_db_index :user_id}
    it {should have_db_index :story_id}
    it {should have_db_index :cloned_story_id}
  end
end
