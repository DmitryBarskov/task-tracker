module Mutations
  class UpdateTask < BaseMutation
    argument :comment_id, ID, required: true
    argument :task_id, ID, required: true
    argument :content, String, required: true


    type Types::CommentType

    def resolve(**_options)
      result = ::UpdateComment.call(
        comment_params: _options.slice(:task_id, :content),
        current_user: current_user,
        task_id: _options[:comment_id]
      )

      if result.success?
        result.comment
      else
        nil
      end
    end
  end
end
