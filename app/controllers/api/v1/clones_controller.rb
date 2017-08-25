class Api::V1::ClonesController < Api::BaseController
  before_action :find_story, only: :create

  def create
    if story.present?
      check_cloned ? clone_other_story : story_cloned
    else
      render json: {
        messages: I18n.t("stories.messages.story_not_found")
      }, status: :not_found
    end
  end

  private

  attr_reader :story, :story_clone, :relationship_cloned_story

  def find_story
    @story = Story.find_by id: params[:story_id]
  end

  def find_cloned_story
    @story_clone =
      Story.find_by id: relationship_cloned_story.first.cloned_story_id
  end

  def clone_successfully
    CloneStory.create! user_id: current_user.id, story_id: story.id,
      cloned_story_id: story_clone.id
    render json: {
      messages: I18n.t("stories.messages.clone_successfully"),
      data: {story: story_serializer}
    }, status: :ok
  end

  def story_cloned
    find_cloned_story
    render json: {
      messages: I18n.t("stories.messages.story_cloned"),
      data: {story: story_serializer}
    }, status: :ok
  end

  def clone_fail
    render json: {
      messages: I18n.t("stories.messages.clone_fail")
    }, status: :unprocessable_entity
  end

  def story_serializer
    Serializers::Stories::StorySerializer.new(object: story_clone).serializer
  end

  def check_cloned
    @relationship_cloned_story =
      CloneStory.find_cloned_story current_user.id, params[:story_id]
    relationship_cloned_story.present? ? false : true
  end

  def clone_other_story
    @story_clone = story.dup
    clone_each_steps
    story_clone.user = current_user
    story_clone.save ? clone_successfully : clone_fail
  end

  def clone_each_steps
    story.steps.each do |step|
      step_clone = step.dup
      step.sub_steps.each do |sub_step|
        sub_step_clone = sub_step.dup
        step_clone.sub_steps << sub_step_clone
      end
      story_clone.steps << step_clone
    end
  end
end
