module Types
  module Payloads
    class DestroyProjectPayload < Types::BaseObject
      field :project, ProjectType, null: false
    end
  end
end
