class UpdateTask
  class UpdateRecord
    include Interactor

    delegate :task_params, :task, to: :context

    def call
      unless task.update(task_params)
        context.fail!(error: "Invalid data")
      end
    end
  end
end
