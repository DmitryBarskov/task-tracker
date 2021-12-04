module Types
  module Inputs
    class SignInInput < Types::BaseInputObject
      argument :email, Email, required: true
      argument :password, String, required: true
    end
  end
end
