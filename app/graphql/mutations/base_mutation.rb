module Mutations
  class BaseMutation < GraphQL::Schema::Mutation
    include ActionPolicy::GraphQL::Behaviour
    include ::GraphqlErrors

    argument_class Types::BaseArgument
    field_class Types::BaseField
    object_class Types::BaseObject

    def current_user
      @context[:current_user]
    end
  end
end
