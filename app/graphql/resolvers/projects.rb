module Resolvers
  class Projects < Resolvers::Base
    type [Types::ProjectType], null: false

    def resolve(**params)
      ::Project.all
    end
  end
end
