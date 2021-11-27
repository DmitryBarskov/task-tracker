module Mutations
  class CreateTask < BaseMutation
    argument :project_id, ID, required: true
    argument :title, String, required: true
    argument :description, String, required: false
    argument :deadline_at, GraphQL::Types::ISO8601DateTime, required: true

    type Types::TaskType

    def resolve(**options)
      result = ::CreateTask.call(
        task_params: options ,
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