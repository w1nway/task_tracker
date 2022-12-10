module Mutations
  class UpdateTask < BaseMutation
    include AuthenticableGraphqlUser

    argument :input, Types::Inputs::UpdateTaskInput, required: true

    type Types::Payloads::UpdateTaskPayload

    def resolve(input:)
      task = Task.find_by(id: input.task_id)
      result = Tasks::Update.call(task: task, task_params: input.to_h.except(:task_id))

      result.to_h.merge(errors: formatted_errors(result.task))
    end
  end
end
