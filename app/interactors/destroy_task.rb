class DestroyTask
  include Interactor

  delegate :task, to: :context

  def call
    context.fail!(error: "Invalid data") unless task.destroy
  end
end


