module Types
  module Inputs
    class SignUpInput < Types::BaseInputObject
      argument :email, Email, required: true
      argument :password, String, required: true
      argument :full_name, String, required: false
    end
  end
end
