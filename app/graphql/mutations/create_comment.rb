module Mutations
  class CreateComment < BaseMutation
    argument :task_id, ID, required: true
    argument :content, String, required: true

    type Types::CommentType

    def resolve(**options)
      result = ::CreateComment.call(
        comment_params: options.merge(user_id: current_user.id),
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
