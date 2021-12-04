module Resolvers
  class Base < GraphQL::Schema::Resolver
    include ActionPolicy::GraphQL::Behaviour
    argument_class Types::BaseArgument

    def current_user
      @context[:current_user]
    end
  end
end
