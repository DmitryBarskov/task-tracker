module Mutations
  class CreateTask < BaseMutation
    argument :task_id, ID, required: true
    argument :content, String, required: true

    type Types::CommentType

    def resolve(**_options)
      result = ::CreateComment.call(
        comment_params: _options ,
        current_user: current_user
      )

      if result.success?
        result.comment
      else
        nil
      end
    end
  end
end

  # def comment_params
  #   params.require(:comment)
  #     .permit(:content, :task_id)
  #     .merge(
  #       {
  #         user: current_user
  #       }
  #     )
  # end
