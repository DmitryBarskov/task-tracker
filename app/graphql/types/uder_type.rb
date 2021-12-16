module Types
  class UserType < Types::BaseObject

    field :id, ID, null: false
    field :email, String, null: false
    field :password_digest, String, null: true
    field :full_name, String, null: true
    field :projects, [Types::ProjectType], null:true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    
  end
end