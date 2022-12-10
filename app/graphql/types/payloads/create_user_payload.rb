module Types
  module Payloads
    class CreateUserPayload < Types::BaseObject
      field :user, UserType, null: false
      field :errors, [Types::UserError], null: true
    end
  end
end
