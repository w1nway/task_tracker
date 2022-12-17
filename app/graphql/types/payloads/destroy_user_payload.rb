module Types
  module Payloads
    class DestroyUserPayload < Types::BaseObject
      field :user, UserType, null: false
    end
  end
end
