class Api::V1::CommentsController < Api::BaseController
  before_action :correct_user, only: :destroy
  before_action :find_commentable

  def create
    @comment = commentable.comments.new comments_params
    comment.user = current_user
    comment.save ? comment_create_success : comment_create_fail
  end

  private

  attr_reader :comment, :story, :step, :commentable

  def comments_params
    params.require(:comment).permit Comment::ATTRIBUTES_PARAMS
  end

  def find_commentable
    @story = Story.find_by id: params[:story_id]
    @step = Step.find_by id: params[:step_id]
    @commentable =
      if story.present? && step.present?
        step
      else
        story
      end
  end

  def comment_create_success
    render json: {
      messages: I18n.t("comments.messages.comment_created"),
      data: {comment: comment_serializer}
    }, status: :ok
  end

  def comment_create_fail
    render json: {
      messages: comment.errors.full_messages.to_sentence
    }, status: :unprocessable_entity
  end

  def params_id
    params[:id]
  end

  def comment_serializer
    Serializers::Comments::CommentSerializer.new(object: comment).serializer
  end
end
