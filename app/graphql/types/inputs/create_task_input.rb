module Types
  module Inputs
    class CreateTaskInput < Types::BaseInputObject
      argument :project_id, Integer, required: true
      argument :title, String, required: true
      argument :description, String, required: false
      argument :deadline_at, GraphQL::Types::ISO8601DateTime, required: true
    end
  end
end
