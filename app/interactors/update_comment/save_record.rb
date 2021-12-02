class UpdateComment
  class SaveRecord
    include Interactor

    delegate :comment_params, :comment,  to: :context

    def call
      context.fail!(error: "Invalid data") unless comment.update(comment_params)
    end
  end
end
