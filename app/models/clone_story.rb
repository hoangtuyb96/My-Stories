class CloneStory < ApplicationRecord
  belongs_to :user
  belongs_to :story

  lambda_find_cloned_story = lambda do |user_id, story_id|
    where user_id: user_id, story_id: story_id
  end

  scope :find_cloned_story, lambda_find_cloned_story

  validates :user, presence: true
  validates :story, presence: true
end
