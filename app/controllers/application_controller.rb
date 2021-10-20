class ApplicationController < ActionController::Base
	class UserNotAuthenticated < StandardError; end

	rescue_from UserNotAuthenticated, with: :not_authenticated!

	def current_user
		raise UserNotAuthenticated, "No current_user_id in session" unless session[:current_user_id]
		@current_user ||= User.find_by(id: session[:current_user_id])
	end
	helper_method :current_user

	private

	def not_authenticated!
		redirect_to new_session_path, alert: "You must log in first :)"
	end
end
