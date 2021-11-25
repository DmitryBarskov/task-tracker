module Mutations
  class SignUp < Mutations::BaseMutation
    argument :input, Types::Inputs::SignUpInput, required: true

    type Types::Payloads::SignUpPayload

    def resolve(input:)
      result = RegisterUser.call(params: input.to_h)

      if result.success?
        result.to_h
      else
        format_errors user: result.user
      end
    end
  end
end
