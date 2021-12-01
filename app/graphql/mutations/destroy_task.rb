module Mutations
  class DestroyTask < BaseMutation
    argument :id, ID, required: true

    type Types::TaskType

    def resolve(**params)
      task = Task.find_by(id: params[:id])

      if task.present?
        result = ::DestroyTask.call(
          task: task
        )
        result.task
      end
    end
  end
end

