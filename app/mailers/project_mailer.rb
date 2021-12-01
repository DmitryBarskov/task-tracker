class ProjectMailer < ApplicationMailer
  default from: 'from@example.com'
  layout 'mailer'

  def project_created(project, user)
    @project = project

    mail(to: user.email)
  end
end


  def project_update(project, user)
    @project = project

    mail(to: user.email)
  end
end