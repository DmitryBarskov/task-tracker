module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField
    field :projects, resolver: Resolvers::Projects
    field :project, resolver: Resolvers::Project
    field :users, resolver: Resolvers::Users
    field :user, resolver: Resolvers::User
  end
end
