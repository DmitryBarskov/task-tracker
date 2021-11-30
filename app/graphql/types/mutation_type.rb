module Types
  class MutationType < Types::BaseObject
    # TODO: remove me

    field :create_project, mutation: Mutations::CreateProject
    field :update_project, mutation: Mutations::UpdateProject
  end
end
