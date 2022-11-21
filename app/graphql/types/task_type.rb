module Types
  class TaskType < Types::BaseObject
    field :id, ID, null: false
    field :title, String
    field :description, String
    field :deadline_at, GraphQL::Types::ISO8601DateTime
    field :project_id, Integer, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :state, String, null: false
    field :project, ProjectType, null: false
  end
end
