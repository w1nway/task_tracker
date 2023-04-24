module Mutations
  class DestroyComment < BaseMutation
    include AuthenticableGraphqlUser

    argument :input, Types::Inputs::DestroyCommentInput, required: true

    type Types::Payloads::DestroyCommentPayload

    def resolve(input:)
      comment = Comment.find(input.id)

      result = Comment::Destroy.call(comment: comment).to_h

      result.to_h.merge(errors: formatted_errors(result.comment))
    end
  end
end
