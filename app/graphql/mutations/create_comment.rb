module Mutations
  class CreateComment < BaseMutation
    argument :content, String, required: true
    argument :task_id, ID, required: true
    argument :user_id, ID, required: true

    type Types::CommentType

    def resolve(**options)
      result = ::CreateComment.call(comment_params: options,
                                    current_user: current_user)

      if result.success?
        result.comment
      else
        nil
        
      end
    end
  end
end
