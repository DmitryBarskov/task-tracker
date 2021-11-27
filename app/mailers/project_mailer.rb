class ProjectMailer < ApplicationMailer
  default from: 'from@example.com'
  layout 'mailer'

  def project_created(project, user)
    @project = project

    mail(to: user.email)
  end

  def project_updated(project, user)
    project_created(project, user)
  end
end
