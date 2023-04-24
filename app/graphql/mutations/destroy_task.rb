module Mutations
  class DestroyTask < BaseMutation
    include AuthenticableGraphqlUser

    argument :input, Types::Inputs::DestroyTaskInput, required: true

    type Types::Payloads::DestroyTaskPayload

    def resolve(input:)
      task = Task.find(input.id)

      result = Tasks::Destroy.call(task: task).to_h

      result.to_h.merge(errors: formatted_errors(result.task))
    end
  end
end
