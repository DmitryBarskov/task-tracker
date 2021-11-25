class CreateTask
  class SaveRecord
    include Interactor

    delegate :prepared_task_params, to: :context

    def call
      context.task = task
      context.fail!(error: "Invalid data") unless task.save 
    end

    private

    def task
      @task ||= Task.new(prepared_task_params)
    end
  end
end
