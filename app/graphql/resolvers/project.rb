module Resolvers
	class Project < Resolvers::Base
		argument :id, ID, required: true

		type Types::ProjectType, null: true

		def resolve(**_params)
			::Project.find_by(id: _params[:id])
		end
	end
end
