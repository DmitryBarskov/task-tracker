module Types
  class Email < Types::BaseScalar
    description "A valid Email, transported as a string"
 
    def self.coerce_input(input_value, context)
      return input_value if URI::MailTo::EMAIL_REGEXP.match?(input_value)
 
      raise GraphQL::CoercionError, "#{input_value} is not a valid Email"
    end
 
    def self.coerce_result(value, context)
      value.to_s
    end
  end
end
