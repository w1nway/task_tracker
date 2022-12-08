module Types
  class MutationType < Types::BaseObject
    field :sign_up, mutation: Mutations::SignUp
    field :sign_in, mutation: Mutations::SignIn

    field :create_project, mutation: Mutations::CreateProject
    field :update_task, mutation: Mutations::UpdateTask
    field :create_user, mutation: Mutations::CreateUser
    field :update_project, mutation: Mutations::UpdateProject
  end
end
