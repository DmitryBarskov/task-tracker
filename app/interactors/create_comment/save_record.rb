class CreateComment
  class SaveRecord
    include Interactor

    delegate :prepared_comment_params, to: :context

    def call
      context.comment = comment
      context.fail!(error: "Invalid data") unless comment.save 
    end

    private

    def comment
      @comment ||= Comment.new(prepared_comment_params)
    end
  end
end
