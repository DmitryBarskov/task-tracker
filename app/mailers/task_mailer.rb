class TaskMailer < ApplicationMailer
  
  default from: 'from@example.com'
  layout 'mailer'

  def task_created(task, user)
    @task = task

    mail(to: user.email)
  end
end