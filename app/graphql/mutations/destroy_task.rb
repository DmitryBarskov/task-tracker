module Mutations
  class DestroyTask < BaseMutation
    argument :task_id, ID, required: true

    type Types::TaskType

    def resolve(**_options)
      result = Task.find_by(id: _options[:task_id])

      if result
        result.destroy
      else
        nil
      end
    end
  end
end
