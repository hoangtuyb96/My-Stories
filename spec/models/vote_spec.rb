require "rails_helper"

RSpec.describe Vote, type: :model do

  describe "database structure" do
     context "columns" do
       it {should have_db_column(:user_id).of_type(:integer)}
       it {should have_db_column(:voteable_id).of_type(:integer)}
       it {should have_db_column(:voteable_type).of_type(:string)}
     end
   end

   describe "validations" do
    before do
      @sample_story_vote = FactoryGirl.build :story_vote
      @sample_step_vote = FactoryGirl.build :step_vote
    end

    it "is invalid if user_id is blank case story" do
      @sample_story_vote.user_id = nil
      expect(@sample_story_vote).to_not be_valid
    end

    it "is invalid if user_id is blank case step" do
      @sample_step_vote.user_id = nil
      expect(@sample_step_vote).to_not be_valid
    end

    it "is invalid if voteable_id is blank case story" do
      @sample_story_vote.voteable_id = nil
      expect(@sample_story_vote).to_not be_valid
    end

    it "is invalid if voteable_id is blank case step" do
      @sample_step_vote.voteable_id = nil
      expect(@sample_step_vote).to_not be_valid
    end

    it "is invalid if voteable_type is blank case story" do
      @sample_story_vote.voteable_type = nil
      expect(@sample_story_vote).to_not be_valid
    end

    it "is invalid if voteable_type is blank case step" do
      @sample_step_vote.voteable_type = nil
      expect(@sample_step_vote).to_not be_valid
      end

    it "is invalid if duplicate vote case story" do
      @sample_story_vote2 = FactoryGirl.build :story_vote
      expect(@sample_story_vote2).to_not be_valid
    end

    it "is invalid if duplicate vote case step" do
      @sample_step_vote2 = FactoryGirl.build :step_vote
      expect(@sample_step_vote2).to_not be_valid
    end
   end

  describe "associations" do
    it {should belong_to :user}
  end
end
