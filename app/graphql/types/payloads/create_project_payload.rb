module Types
  module Payloads
    class CreateProjectPayload < Types::BaseObject
      field :project, ProjectType, null: true
    end
  end
end
