module Types
  module Payloads
    class DestroyCommentPayload < Types::BaseObject
      field :comment, CommentType, null: false
    end
  end
end
