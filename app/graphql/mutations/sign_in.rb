module Mutations
  class SignIn < Mutations::BaseMutation
    argument :input, Types::Inputs::SignInInput, required: true

    type Types::Payloads::SignInPayload

    def resolve(input:)
      AuthenticateUser.call(credentials: input.to_h).to_h
    end
  end
end
