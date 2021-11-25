class AuthenticateUser
  include Interactor

  delegate :credentials, to: :context

  def call
    user = User.find_by(email: credentials[:email])&.
                authenticate(credentials[:password])

    context.fail!(errors: errors) unless user.present?

    context.access_token = ::JWT.encode({
      sub: user.id
    }, jwt_secret, 'HS256')
  end

  private

  def jwt_secret
    ENV.fetch('JWT_SECRET')
  end

  def errors
    [{ field: :base, message: 'wrong credentials' }]
  end
end
