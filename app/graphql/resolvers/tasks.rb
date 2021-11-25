module Resolvers
	class Tasks < Resolvers::Base
		type [Types::TaskType], null: false

		def resolve(**_params)
			::Task.all
		end
	end
end
