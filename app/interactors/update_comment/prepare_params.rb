class UpdateComment
  class PrepareParams
    include Interactor

    delegate :current_user, :comment_params, :comment, to: :context

    def call
      # context.prepared_project_params = prepared_project_params
      context.prepared_comment_params = prepared_comment_params
      context.comment = comment
    end

    private

    def prepared_comment_params
      comment_params.merge(user_id: current_user.id)
    end
  end
end
