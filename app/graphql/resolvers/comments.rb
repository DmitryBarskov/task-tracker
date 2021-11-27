module Resolvers
  class Comments < Resolvers::Base
    type [Types::CommentType], null: false

    def resolve(**params)
      ::Comment.all
    end
  end
end
