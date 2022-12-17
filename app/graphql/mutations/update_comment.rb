module Mutations
  class UpdateComment < BaseMutation
    include AuthenticableGraphqlUser

    argument :input, Types::Inputs::UpdateCommentInput, required: true

    type Types::Payloads::UpdateCommentPayload

    def resolve(input:)
      comment_params = input.to_h.except(:comment_id)
      comment = Comment.find(input.comment_id)

      result = Comments::Update.call(comment: comment, comment_params: comment_params)

      result.to_h.merge(errors: formatted_errors(result.comment))
    end
  end
end
