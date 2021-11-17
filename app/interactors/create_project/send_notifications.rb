class CreateProject
  class SendNotifications
    include Interactor

    delegate :project, :current_user, to: :context
    delegate :users, to: :project, prefix: true

    def call
      send_email_notifications
      create_activity
    end

    private

    def create_activity
      RegisterActivityJob.perform_later(current_user.id, "project_created", project.id, "Project")
    end

    def send_email_notifications
      project_users.find_each do |user|
        send_email_notification(project, user)
      end
    end

    def send_email_notification(project, user)
      ProjectMailer.project_created(Project.last, User.last).deliver_later
    end
  end
end
