class Api::V1::StoriesController < Api::BaseController
  before_action :user_signed_in?
  before_action :find_object, only: :show
  before_action :find_comments, only: :show
  skip_before_action :authenticate_user_from_token, only: :show

  def show
    show_response if story.present?
  end

  def create
    @story = current_user.stories.new stories_params
    if story.save
      save_steps if params_steps.present?
      created_response_success
    else
      created_response_fail
    end
  end

  private

  attr_reader :story, :comments, :step

  def find_story
    @story = Story.find_by id: params[:id]
  end

  def find_comments
    @comments = Comment.comments_for_story params[:id]
  end

  def stories_params
    params.require(:story).permit Story::ATTRIBUTES_PARAMS
  end

  def steps_params
    params.require(:step).permit Step::ATTRIBUTES_PARAMS,
      sub_steps_attributes: [:name, :content, :_destroy]
  end

  def params_steps
    params[:story][:step]
  end

  def save_steps
    params_steps.each do |params_step|
      params[:step] = params_step
      @step = story.steps.new steps_params
      unless step.save
        created_response_fail
        break
      end
    end
  end

  def created_response_success
    render json: {
      messages: I18n.t("stories.messages.stories_created"),
      data: {story: story_serializer}
    }, status: :ok
  end

  def created_response_fail
    warden.custom_failure!
    render json: {
      messages: story.errors.full_messages.to_sentence
    }, status: :unprocessable_entity
  end

  def show_response
    render json: {
      messages: I18n.t("stories.messages.stories_showed"),
      data: {story: story_serializer}
    }, status: :ok
  end

  def story_serializer
    Serializers::Story::StorySerializer.new(object: story).serializer
  end
end
