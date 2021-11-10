class CommentsController < ApplicationController

    before_action :authenticate_current_user!

    def create
        comment = Comment.new(comment_params)

        if comment.save
            redirect_to comment, notice: 'Comment created successfully'
        else
            redirect_to comment.task, alert: 'Comment was not created'
        end
    end



    def edit 
    end


    def update
        comment = Comment.new(comment_params)

        if comment.save
            redirect_to comment, notice: 'Comment created successfully'
        else
            redirect_to comment.task, alert: 'Comment was not created'
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