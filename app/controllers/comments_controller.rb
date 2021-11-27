class CommentsController < ApplicationController
  before_action :authenticate_current_user!
  before_action :set_comment

  def create
    comment = create_comment.comment

    if create_comment.success?
      redirect_to comment, notice: 'Comment was successfully created.'
    else
      redirect_to comment.task, alert: 'Comment was not created'
    end
  end

  def edit; end

  def update
    if comment.update_comment.comment
      redirect_to comment, notice: 'Comment was successfully updated.'
    else
      redirect_to comment.task, alert: 'Comment was not updated'
    end
  end

  private

  def set_comment
    @comment = Comment.find_by(id: params[:id])
  end

  def comment_params
    params.require(:comment)
      .permit(:content, :task_id)
      .merge(
        {
          user: current_user
        }
      )
  end

  def create_comment
    @comment ||= CreateComment.call(comment_params: comment_params, current_user: current_user)
  end

  def update_comment
    @comment ||= UpdateComment.call(comment_params: comment_params, current_user: current_user, comment: @comment)
  end

end
