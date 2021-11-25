class UpdateTask
  class PrepareParams
    include Interactor

    delegate :current_user, :task_params, :task_id, to: :context

    def call
      # context.prepared_project_params = prepared_project_params
      context.prepared_task_params = prepared_task_params
      context.task_id = task_id
    end

    private

    def prepared_task_params
      task_params.merge(user_id: current_user.id)
    end
  end
end
