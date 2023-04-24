module Mutations
  class DestroyComment < BaseMutation
    include AuthenticableGraphqlUser

    argument :input, Types::Inputs::DestroyCommentInput, required: true

    type Types::Payloads::DestroyCommentPayload

    def resolve(input:)
      comment = Comment.find(input.id)
      Comment::Destroy.call(comment: comment).to_h
    end
  end
end
