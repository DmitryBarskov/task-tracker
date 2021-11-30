module Mutations
  class UpdateComment < BaseMutation
    argument :comment_id, ID, required: true
    argument :task_id, ID, required: true
    argument :content, String, required: true


    type Types::CommentType

    def resolve(**options)
      result = ::UpdateComment.call(
        comment_params: options.slice(:task_id, :content),
        current_user: current_user,
        comment_id: _options[:comment_id]
      )

      if result.success?
        result.comment
      else
        nil
      end
    end
  end
end
