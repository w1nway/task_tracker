module Types
  module Payloads
    class DestroyProjectPayload < Types::BaseObject
      field :project, ProjectType, null: true
      field :errors, [Types::UserError], null: false
    end
  end
end
