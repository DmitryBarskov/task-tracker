module Resolvers
  class Projects < Resolvers::Base
    type Types::ProjectType.connection_type, null: false

    def resolve(**params)
      ::Project.all
    end
  end
end
