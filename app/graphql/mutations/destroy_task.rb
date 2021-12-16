module Mutations
  class DestroyTask < BaseMutation

    argument :id, ID, required: true

    type Types::TaskType

    def resolve(**options)
      task = ::Task.find_by(id: options[:id])

      if task.present?
        result = task.destroy
      else

        nil
      end
      
    end
  end
end