module Types
  module Payloads
    class UpdateTaskPayload < Types::BaseObject
      field :task, TaskType, null: true
      field :errors, [Types::UserError], null: false
    end
  end
end
