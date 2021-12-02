module Mutations
  class UpdateComment < BaseMutation
    argument :comment_id, ID, required: true
    argument :task_id, ID, required: true
    argument :content, String, required: true


    type Types::CommentType

    def resolve(**options)
      comment = ::Comment.find_by(id: options[:comment_id])
      result = ::UpdateComment.call(
        comment_params: options.slice(:task_id, :content).merge(user_id: current_user.id),
        current_user: current_user,
        comment: comment
      )
      if result.success?
        result.comment
      else
        nil
      end
    end
  end
end
