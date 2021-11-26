class CommentsController < ApplicationController
  before_action :authenticate_current_user!
  before_action :set_comment
  before_action -> { authorize @comment }, only: %i[show edit update]

  # def index
  # end

  def create
    @comment = Comment.new(comment_params)
    authorize @comment
    if @comment.save
      redirect_to @comment.task, notice: 'Comment was successfully created.'
    else
      redirect_to @comment.task, alert: @comment.errors.full_messages
        # 'Comment was not created'
    end
  end

  def edit
    @task = @comment.task
  end

  def update
    if @comment.update(comment_params)
      redirect_to @comment.task, notice: 'Comment was successfully updated.'
    else
      render :edit
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
              user: current_user,
              task_id: params[:task_id]
            }
          )
  end
end
