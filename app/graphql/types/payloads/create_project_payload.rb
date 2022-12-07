module Types
  module Payloads
    class CreateProjectPayload < Types::BaseObject
      field :project, ProjectType, null: false
      field :errors, [Types::UserError], null: false
    end
  end
end
