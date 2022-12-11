module Mutations
  class DestroyProject < BaseMutation
    include AuthenticableGraphqlUser

    argument :input, Types::Inputs::DestroyProjectInput, required: true

    type Types::Payloads::DestroyProjectPayload

    def resolve(input:)
      project = Project.find(input.id)
      result = Projects::Destroy.call(project: project)
      result.to_h
    end
  end
end
