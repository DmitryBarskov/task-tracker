module Authorization
  class AuthorizationError < StandardError; end

  rescue_from AuthorizationError, with: :deny_access!

  private

  def deny_access!
    redirect_to projects_path, alert: "You are not permitted to perform this action!"
  end
end
