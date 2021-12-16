module Mutations
  class UpdateComment < BaseMutation

    argument :id, ID, required: true
    argument :content, String, required: true

    type Types::CommentType

    def resolve(**options)
      comment = ::Comment.find_by(id: options[:id])
      if comment.present?

        result = ::UpdateComment.call(
          comment_params: options,
          comment: comment,
          current_user: current_user)
        
        if result.success?
          result.comment
        else
          nil
        end

      else
        nil
      end
      
    end
  end
end