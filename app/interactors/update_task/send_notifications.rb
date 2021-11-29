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
      RegisterActivityJob.perform_later(current_user.id, "task_updated", task.id, "Task")
    end

    def send_email_notifications
      task.project.users.each do |user|
        send_email_notification(task, user)
      end
    end

    def send_email_notification(task, user)
      TaskMailer.task_created(Task.last, User.last).deliver_later
    end
  end
end
