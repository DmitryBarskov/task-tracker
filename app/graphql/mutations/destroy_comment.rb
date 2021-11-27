module Mutations
  class DestroyComment < BaseMutation
    argument :comment_id, ID, required: true

    type Types::CommentType

    def resolve(**options)
      result = Comment.find_by(id: options[:comment_id])

      if result
        result.destroy
      else
        nil
      end
    end
  end
end
