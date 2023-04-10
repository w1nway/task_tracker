module Types
  class TaskType < Types::BaseObject
    field :id, ID
    field :title, String
    field :description, String
    field :deadline_at, GraphQL::Types::ISO8601DateTime
    field :created_at, GraphQL::Types::ISO8601DateTime
    field :updated_at, GraphQL::Types::ISO8601DateTime
    field :state, String
    field :project, ProjectType, null: false
    field :comments, [CommentType], null: false
  end
end
