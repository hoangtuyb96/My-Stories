class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :voteable, polymorphic: true

  validates :user, presence: true,
    uniqueness: {scope: [:voteable_type, :voteable_id]}
  validates :voteable, presence: true
end
