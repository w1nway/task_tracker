module Types
  module Payloads
    class DestroyTaskPayload < Types::BaseObject
      field :task, TaskType, null: false
    end
  end
end
