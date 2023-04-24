module Mutations
  class DestroyTask < BaseMutation
    include AuthenticableGraphqlUser

    argument :input, Types::Inputs::DestroyTaskInput, required: true

    type Types::Payloads::DestroyTaskPayload

    def resolve(input:)
      task = Task.find(input.id)
      Tasks::Destroy.call(task: task).to_h
    end
  end
end
