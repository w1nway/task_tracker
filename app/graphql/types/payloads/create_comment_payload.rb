module Types
  module Payloads
    class CreateCommentPayload < Types::BaseObject
      field :comment, Types::CommentType, null: false
      field :errors, [Types::UserError], null: false
    end
  end
end
