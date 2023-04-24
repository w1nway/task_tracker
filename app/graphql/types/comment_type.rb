module Types
  class CommentType < Types::BaseObject
    field :id, ID
    field :content, String
    field :created_at, GraphQL::Types::ISO8601DateTime
    field :updated_at, GraphQL::Types::ISO8601DateTime
    field :task, TaskType, null: false
  end
end
