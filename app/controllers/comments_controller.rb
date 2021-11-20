class CommentsController < ApplicationController
  before_action :authenticate_current_user!
  before_action :set_comment, only: %w[create edit update]
  before_action :set_task, only: %w[create edit update]
  before_action -> { authorize @comment }, only: %i[show edit update]

  def index
  end

  def create
    comment = Comment.new(comment_params)
    authorize comment,:create?

    if comment.save
      redirect_to comment.task, notice: 'Comment was successfully created.'
    else
      redirect_to comment.task, alert: comment.errors.first.full_message
    end
  end

  def edit
  end

  def update
    if @comment.update(comment_params)
      redirect_to @comment.task, notice: 'Comment was successfully updated.'
    else
      redirect_to @comment.task, alert: @comment.errors.first.full_message
    end
  end

  private

  def set_comment
    @comment = Comment.find_by(id: params[:id])
  end

  def set_task
    @task = Task.find(params[:task_id])
  end

  def comment_params
    params.require(:comment)
          .permit(:content, :task_id)
          .merge(
            {
              user: current_user,
            }
          )
  end
end
