module Mutations
  class CreateComment < BaseMutation
    argument :content, String, required: true
    argument :task_id, Integer, required: true

    type Types::CommentType

    def resolve(**params)
      result = ::CreateComment.call(
        comment_params: params,
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
