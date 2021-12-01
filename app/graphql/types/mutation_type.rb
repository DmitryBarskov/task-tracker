module Types
  class MutationType < Types::BaseObject
    field :update_comment, mutation: Mutations::UpdateComment
    field :create_comment, mutation: Mutations::CreateComment
    field :destroy_task, mutation: Mutations::DestroyTask
    field :update_task, mutation: Mutations::UpdateTask
    field :create_task, mutation: Mutations::CreateTask
    field :destroy_project, mutation: Mutations::DestroyProject
    field :update_project, mutation: Mutations::UpdateProject
    field :create_project, mutation: Mutations::CreateProject
  end
end
