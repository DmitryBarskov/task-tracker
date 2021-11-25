class CreateTask
  class PrepareParams
    include Interactor

    delegate :current_user, :task_params, to: :context

    def call
      context.prepared_task_params = prepared_task_params
    end

    private

    def prepared_task_params
      task_params.merge(user_id: current_user.id)
    end
  end
end
