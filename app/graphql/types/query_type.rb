module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    field :projects, resolver: Resolvers::Projects
    field :project, resolver: Resolvers::Project
    field :tasks, resolver: Resolvers::Tasks
    field :task, resolver: Resolvers::Task
  end
end
