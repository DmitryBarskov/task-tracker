module Types
  module Payloads
    class SignUpPayload < Types::BaseObject
      field :currentUser, CurrentUserType, null: false, method: :user
      field :errors, [Types::Payloads::UserError], null: true
    end
  end
end
