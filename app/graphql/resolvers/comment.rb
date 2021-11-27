module Resolvers
	class Comment < Resolvers::Base
		argument :id, ID, required: true

		type Types::CommentType, null: true

		def resolve(**_params)
			::CommentType.find_by(id: _params[:id])
		end
	end
end
