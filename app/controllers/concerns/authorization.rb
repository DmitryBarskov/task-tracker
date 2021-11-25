module Authorization
  extend ActiveSupport::Concern

  included do
  end

  private

  def deny_access!(error)
    redirect_to projects_path, alert: error.message
  end
end
