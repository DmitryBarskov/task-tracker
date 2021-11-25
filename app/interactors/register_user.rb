class RegisterUser
  include Interactor

  delegate :params, to: :context

  def call
    context.user = User.new(params)

    context.user.save!
  rescue ActiveRecord::RecordInvalid
    context.fail!
  end
end
