module Resolvers
	class Task < Resolvers::Base
		argument :id, ID, required: true

		type Types::TaskType, null: true

		def resolve(**_params)
			::Task.find_by(id: _params[:id])
		end
	end
end
