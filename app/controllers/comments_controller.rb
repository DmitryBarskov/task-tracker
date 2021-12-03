class CommentsController < ApplicationController
  before_action :authenticate_current_user!
  before_action :set_comment
  before_action -> { authorize @comment }, only: %i[edit update]

  def create
    comment = create_comment.comment
    authorize comment

    if create_comment.success?
      redirect_to comment.task, notice: 'Comment was successfully created.'
    else
      redirect_to comment.task, alert: 'Comment was not created.'
    end
  end

  def edit
    @task = @comment.task
  end

  def update
    if update_comment.success?
      redirect_to @comment.task, notice: 'Comment was successfully updated.'
    else
      redirect_to @comment.task, alert: 'Comment was not updated.'
    end
  end

  private

  def create_comment
    @create_comment ||=
      CreateComment.call(comment_params: comment_params, current_user: current_user)
  end

  def update_comment
    @update_comment ||=
      UpdateComment.call(comment_params: comment_params, comment: @comment)
  end
  
  def set_comment
    @comment = Comment.find_by(id: params[:id])
  end

  def comment_params
    params.require(:comment)
      .permit(:content, :task_id)
      .merge(
        {
          user: current_user,
          task_id: params[:task_id]
        }
      )
  end
end
