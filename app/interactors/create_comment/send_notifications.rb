class CreateComment
  class SendNotifications
    include Interactor

    delegate :comment, :current_user, to: :context

    def call
      send_email_notification
      create_activity
    end

    private

    def create_activity
      RegisterActivityJob.perform_later(current_user.id, "comment_created", comment.id, "Comment")
    end
  end
end
