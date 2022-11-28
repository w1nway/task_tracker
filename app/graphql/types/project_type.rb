module Types
  class ProjectType < Types::BaseObject
    field :id, ID
    field :name, String
    field :description, String
    field :created_at, GraphQL::Types::ISO8601DateTime
    field :updated_at, GraphQL::Types::ISO8601DateTime
    field :tasks, [TaskType], null: false
  end
end
