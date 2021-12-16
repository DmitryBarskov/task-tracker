module Resolvers
  class User < Resolvers::Base
    argument :id, ID, required: true

    type Types::UserType, null: true

    def resolve(**params)
      ::User.find_by(id: params[:id])
    end
  end
end