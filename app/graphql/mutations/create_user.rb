module Mutations
  class CreateUser < BaseMutation
    include AuthenticableGraphqlUser

    argument :input, Types::Inputs::CreateUserInput, required: true

    type Types::Payloads::CreateUserPayload

    def resolve(input:)
      result = Users::Create.call(user_params: input.to_h)

      if result.success?
        result.to_h
      else
        result.to_h.merge(errors: formatted_errors(result.user))
      end
    end
  end
end
