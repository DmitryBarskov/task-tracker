class CommentsController < ApplicationController
  skip_after_action :verify_authorized
  before_action :authenticate_current_user!
  before_action :set_comment

  def new
    @comment = Comment.new
  end

  def create
    task = Task.find_by(id: params[:task_id])
    @comment = task.comments.new(comment_params)
    if @comment.save
      redirect_to task_path(@comment.task_id), notice: 'Comment was successfully created'
    else
      redirect_to task_path(@comment.task_id), alert: 'Comment was not created'
    end
  end

  def edit
    @comment = Comment.find(params[:id])
    @task = Task.find(params[:task_id])
  end

  def update
    if @comment.update(comment_params)
      redirect_to task_path(@comment.task_id), notice: 'Comment was successfully updated'
    else
      redirect_to task_path(@comment.task_id), alert: 'Comment was not updated'
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
end
