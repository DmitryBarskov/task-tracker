class CommentsController < ApplicationController
  before_action :authenticate_current_user!
  before_action :set_comment
  before_action -> { authorize @comment }, only: %i[edit update destroy]

  def new
    authorize @comment
    @comment = Comment.new
  end

  def create
    authorize Comment, :create?

    comment = create_comment.comment

    if create_comment.success?
      redirect_to comment.task, notice: 'Comment was successfully created.'
    else
      redirect_to comment.task, alert: 'Comment was not created'
    end
  end

  def edit
    @comment = Comment.find(params[:id])
    @task = Task.find(params[:task_id])
  end

  def update

    if update_comment.success?
      redirect_to @comment.task, notice: 'Comment was successfully updated.'
    else
      redirect_to @comment.task, alert: 'Comment was not updated'
    end
  end

  def destroy
    @comment.destroy!

    redirect_to task_path(@comment.task_id)
  end

  private

  def set_comment
    @comment = Comment.find_by(id: params[:id])
  end

  def comment_params
    params.require(:comment).permit(:content, :task_id).merge(
        {
          user_id: current_user.id,
          task_id: params[:task_id]
        }
      )
  end

  def create_comment
    @create_comment ||= CreateComment.call(comment_params: comment_params,
                                    current_user: current_user)
  end

  def update_comment
    @update_comment ||= UpdateComment.call(comment_params: comment_params, comment: @comment,
                                    current_user: current_user)
  end
end
