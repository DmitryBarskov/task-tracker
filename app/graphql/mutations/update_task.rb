module Mutations
  class UpdateTask < BaseMutation
    argument :task_id, ID, required: true
    argument :project_id, ID, required: true
    argument :title, String, required: true
    argument :description, String, required: false
    argument :deadline_at, GraphQL::Types::ISO8601DateTime, required: true

    type Types::TaskType

    def resolve(**_options)
      result = ::UpdateTask.call(
        task_params: _options.slice(:project_id, :title, :description, :deadline_at),
        current_user: current_user,
        task_id: _options[:task_id]
      )

      if result.success?
        result.task
      else
        nil
      end
    end
  end
end
