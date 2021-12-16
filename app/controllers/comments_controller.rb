class CommentsController < ApplicationController
  before_action :authenticate_current_user!
  before_action :set_comment, only: %i[edit update]
  before_action -> { authorize @comment }, only: %i[edit update]

  def new
    @comment = Comment.new
    authorize @comment
  end

  def create
    authorize Comment, :create?
    @task = Task.find_by(id: params[:task_id])
    @comment = create_comment.comment

    if create_comment.success?
      redirect_to @comment.task, notice: 'Comment was successfully created'
    else
      redirect_to @comment.task, alert: @comment.errors.full_messages.first
    end
  end

  def edit
    @task = Task.find(params[:task_id])
    @comment = Comment.find(params[:id])
  end

  def update
    @task = Task.find(params[:task_id])
    if update_comment.success?
      redirect_to @comment.task, notice: 'Comment was successfully updated'
    else
      redirect_to @comment.task, alert: @comment.errors.full_messages.first
    end
  end

  private

  def set_comment
    @comment = Comment.find_by(id: params[:id])
  end

  def create_comment
    @create_comment ||= 
          CreateComment.call(comment_params: comment_params,
                             current_user: current_user)
  end

  def update_comment
    @update_comment ||= 
            UpdateComment.call(comment_params: comment_params,
                               comment: @comment, 
                               current_user: current_user)
  end

  def comment_params
    params.require(:comment)
      .permit(:content)
      .merge(
        {
          user: current_user,
          task: @task
        }
      )
  end
end