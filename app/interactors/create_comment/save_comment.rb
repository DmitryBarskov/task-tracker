class CreateComment
  class SaveComment
    include Interactor

    delegate :comment_params, to: :context

    def call
      context.comment = comment
      context.fail!(error: "Invalid data") unless comment.save 
    end

    private

    def comment
      @comment ||= Comment.new(comment_params)
    end
  end
end