module Types
  module Payloads
    class UpdateCommentPayload < Types::BaseObject
      field :comment, CommentType, null: false
      field :errors, [Types::UserError], null: false
    end
  end
end
