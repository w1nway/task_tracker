module Types
  module Payloads
    class DestroyProjectPayload < Types::BaseObject
      field :project, ProjectType, null: false
      field :errors, [Types::UserError], null: true
    end
  end
end
