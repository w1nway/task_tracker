module Types
  module Payloads
    class UpdateTaskPayload < Types::BaseObject
      field :task, TaskType, null: false
      field :errors, [Types::UserError], null: false
    end
  end
end
