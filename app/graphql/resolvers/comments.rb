module Resolvers
	class Comments < Resolvers::Base
		type [Types::CommentType], null: false

		def resolve(**_params)
			::Comment.all
		end
	end
end
