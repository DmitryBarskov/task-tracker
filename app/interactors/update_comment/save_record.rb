class UpdateComment
  class SaveRecord
    include Interactor

    delegate :current_user, :prepared_comment_params, :comment, to: :context

   def call
      context.comment = comment
      unless comment.update(prepared_comment_params)
        context.fail!(error: "Invalid data")
      end
    end
  end
end