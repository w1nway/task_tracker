module Mutations
  class CreateUser < BaseMutation
    argument :input, Types::Inputs::CreateUserInput, required: true

    type Types::Payloads::CreateUserPayload

    def resolve(input:)
      result = Users::Create.call(user_params: input.to_h)

      result.to_h.merge(errors: formatted_errors(result.user))
    end
  end
end
