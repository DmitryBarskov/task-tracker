class CommentMailer < ApplicationMailer
  default from: 'from@example.com'
  layout 'mailer'

  def comment_created(comment, user)
    @comment = comment

    mail(to: user.email)
  end
end
