module Mutations
  class UpdateTask < BaseMutation
    argument :id, ID, required: true
    argument :title, String, required: false
    argument :description, String, required: false
    argument :deadline_at, GraphQL::Types::ISO8601DateTime, required: false
    argument :project_id, Integer, required: false
    argument :status, String, required: false

    type Types::TaskType

    def resolve(**params)
      result = ::UpdateTask.call(
        task_params: params,
        task: Task.find_by(id: params[:id])
      )

      if result.success?
        result.task
      else
        nil
      end
    end
  end
end


