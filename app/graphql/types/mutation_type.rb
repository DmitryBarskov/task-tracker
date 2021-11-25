module Types
  class MutationType < Types::BaseObject
    field :create_project, mutation: Mutations::CreateProject
    field :sign_up, mutation: Mutations::SignUp
    field :sign_in, mutation: Mutations::SignIn
  end
end
