module Types
  class QueryType < Types::BaseObject
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    field :projects, resolver: Resolvers::Projects
    field :project, resolver: Resolvers::Project

    field :task, resolver: Resolvers::Task

    field :comment, resolver: Resolvers::Comment
  end
end
