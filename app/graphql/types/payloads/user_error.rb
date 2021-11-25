module Types
  module Payloads
    class UserError < Types::BaseObject
      description "A user-readable error"

      field :field, String, null: false, description: "Invalid field"
      field :message, String, null: false, description: "A description of the error"
    end
  end
end
