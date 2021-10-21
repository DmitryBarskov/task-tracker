module Authorization

  extend ActiveSupport::Concern

  # class AuthorizationError < StandardError
  #   def initialize(message = "You are not permitted to prform this actions!")
  #     super
  #   end
  # end


  included do 
    include Pundit
    after_action :verify_authorized
    rescue_from Pundit::NotAuthorizedError, with: :deny_access!
  end

  private

  def deny_access!(error)
    redirect_to(projects_path, alert: error.message)
  end
end
