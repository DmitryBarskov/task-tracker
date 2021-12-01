module Resolvers
  class Users < Resolvers::Base
    type [Types::UserType], null: false

    def resolve(**params)
      ::User.all
    end
  end
end
