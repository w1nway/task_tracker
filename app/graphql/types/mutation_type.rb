module Types
  class MutationType < Types::BaseObject
    field :sign_up, mutation: Mutations::SignUp
    field :sign_in, mutation: Mutations::SignIn

    field :destroy_user, mutation: Mutations::DestroyUser

    field :create_project, mutation: Mutations::CreateProject
    field :update_project, mutation: Mutations::UpdateProject
    field :destroy_project, mutation: Mutations::DestroyProject

    field :update_task, mutation: Mutations::UpdateTask
    
    field :update_comment, mutation: Mutations::UpdateComment
  end
end
