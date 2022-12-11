module Mutations
  class DestroyProject < BaseMutation
    include AuthenticableGraphqlUser

    argument :input, Types::Inputs::DestroyProjectInput, required: true

    type Types::Payloads::DestroyProjectPayload

    def resolve(input:)
      project = Project.find(input.id)
      result = Projects::Destroy.call(project: project)

      if result.success?
        result.to_h
      else
        result.to_h.merge(errors: formatted_errors(result.project))
      end
    end
  end
end
