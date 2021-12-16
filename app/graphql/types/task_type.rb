module Types
  class TaskType < Types::BaseObject
    field :id, ID, null: false
    field :title, String, null: false
    field :description, String, null: true
    field :deadline_at, GraphQL::Types::ISO8601DateTime, null: true
    field :project, ProjectType, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :status, String, null: false
    field :user_id, Integer, null: false
  end
end
