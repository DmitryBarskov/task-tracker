class UpdateTask
  class SendNotifications
    include Interactor

    delegate :task, :current_user, to: :context

    def call
      send_email_notifications
      create_activity
    end

    private

    def create_activity
      RegisterActivityJob.perform_later(current_user.id, "task_created", task.id, "Task")
    end

    def send_email_notifications
      send_email_notification(task, current_user)
    end
  end
end
