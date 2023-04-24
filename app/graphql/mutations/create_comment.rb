module Mutations
  class CreateComment < BaseMutation
    include AuthenticableGraphqlUser

    argument :input, Types::Inputs::CreateCommentInput, required: true

    type Types::Payloads::CreateCommentPayload

    def resolve(input:)
      task = Task.find(input.task_id)
      result = Comments::Create.call(comment_params: input.to_h, user: current_user, task: task)

      result.to_h.merge(errors: formatted_errors(result.comment))
    end
  end
end
