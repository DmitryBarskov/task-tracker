class CreateTask
  class SaveTask
    include Interactor

    delegate :task_params, to: :context

    def call
      context.task = task
      context.fail!(error: "Invalid data") unless task.save 
    end

    private

    def task
      @task ||= Task.new(task_params)
    end
  end
end
