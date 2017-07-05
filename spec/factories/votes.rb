FactoryGirl.define do
  factory :story_vote, class: "Vote" do |f|
    f.user {FactoryGirl.build :user}
    f.association :voteable, factory: :story
  end

  factory :step_vote, class: "Vote" do |f|
    f.user {FactoryGirl.build :user}
    f.association :voteable, factory: :step
  end
end
