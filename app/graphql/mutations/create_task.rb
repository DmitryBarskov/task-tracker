module Mutations
  class CreateTask < BaseMutation
    argument :title, String, required: true
    argument :description, String, required: false
    argument :deadline_at, GraphQL::Types::ISO8601DateTime, required: true
    argument :project_id, Integer, required: true
    argument :status, String, required: true

    type Types::TaskType

    def resolve(**params)
      result = ::CreateTask.call(
        task_params: params,
        current_user: current_user
      )

      if result.success?
        result.task
      else
        nil
      end
    end
  end
end

