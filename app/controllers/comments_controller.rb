class CommentsController < ApplicationController
  before_action :authenticate_current_user!
  before_action :set_comment, only: %w[create edit update]

  def index
  end

  def create
    authorize Comment, :create?
    comment = Comment.new(comment_params)
    puts comment_params
    puts comment.inspect

    if comment.save
      redirect_to tasks_path, notice: 'Comment was successfully created.'
    else
      redirect_to comment.task, alert: 'Comment was not created'
    end
  end

  def edit
  end

  def update
    if comment.update(comment_params)
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
              user: current_user,
            }
          )
  end
end
