module Mutations
  class UpdateComment < BaseMutation
    argument :id, ID, required: true
    argument :content, String, required: false
    argument :comment_id, Integer, required: false

    type Types::CommentType

    def resolve(**params)
      result = ::UpdateComment.call(
        comment_params: params,
        comment: Comment.find_by(id: params[:id])
      )

      if result.success?
        result.comment
      else
        nil
      end
    end
  end
end
