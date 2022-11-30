module Types
  class MutationType < Types::BaseObject
    field :create_project, mutation: Mutations::CreateProject
    field :update_task, mutation: Mutations::UpdateTask
    field :create_user, mutation: Mutations::CreateUser
  end
end
