module Mutations
  class UpdateProject < BaseMutation
    include GraphqlErrors

    argument :input, Types::Inputs::UpdateProjectInput

    type Types::Payloads::UpdateProjectPayload

    def resolve(input:)
      project = Project.find(input.id)

      result = Projects::Update.call(project_params: input.to_h.except(:id), project: project)

      result.to_h.merge(errors: formatted_errors(result.project))
    end
  end
end
