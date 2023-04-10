module Mutations
  class CreateTask < BaseMutation
    include AuthenticableGraphqlUser

    argument :input, Types::Inputs::CreateTaskInput

    type Types::Payloads::CreateTaskPayload

    def resolve(input:)
      project = Project.find(input.project_id)
      result = Tasks::Create.call(task_params: input.to_h, project: project)

      result.to_h.merge(errors: formatted_errors(result.task))
    end
  end
end
