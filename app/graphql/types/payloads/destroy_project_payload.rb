module Types
  module Payloads
    class DestroyProjectPayload < Types::BaseObject
      field :project, ProjectType, null: true
    end
  end
end
