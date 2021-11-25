module Resolvers
	class Projects < Resolvers::Base
		type [Types::ProjectType], null: false

		def resolve(**_params)
			::Project.all
		end
	end
end
