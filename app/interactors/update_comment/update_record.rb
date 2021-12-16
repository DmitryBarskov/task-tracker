class UpdateComment
  class UpdateRecord
    include Interactor

    delegate :comment_params, :comment, to: :context

    def call
      unless comment.update(comment_params)
        context.fail!(error: "Invalid data")
      end
    end
    
  end
end