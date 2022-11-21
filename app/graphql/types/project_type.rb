module Types
  class ProjectType < Types::BaseObject
    field :id, ID, null: false
    field :name, String
    field :description, String
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :tasks, [TaskType], null: false
  end
end
