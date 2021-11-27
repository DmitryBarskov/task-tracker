class UpdateComment
  class SendNotifications
    include Interactor

    delegate :comment, :current_user, to: :context

    def call
      send_email_notifications
      create_activity
    end

    private

    def create_activity
      RegisterActivityJob.perform_later(current_user.id, "comment_updated", comment.id, "Comment")
    end

    def send_email_notifications
      send_email_notification(comment, current_user)
    end
  end
end
