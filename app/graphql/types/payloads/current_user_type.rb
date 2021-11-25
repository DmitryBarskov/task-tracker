module Types
  module Payloads
    class CurrentUserType < Types::BaseObject
      field :email, String, null: false
      field :full_name, String, null: true
    end
  end
end
