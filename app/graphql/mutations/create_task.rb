module Mutations
  class CreateTask < BaseMutation
    argument :title, String, required: true
    argument :description, String, required: false
    argument :deadline_at, [ID], required: false
    argument :project_id, ID, required: true
    argument :status, String, required: true

    field :task, Types::TaskType, null: false
    field :errors, [String], null: false
    type Types::TaskType

    def resolve(**params)
      task = ::Task.new(
        title: params[:title],
        # description: params[:description],
        # deadline_at: params[:deadline_at],
        project: ::Project.find_by(id: params[:project_id]),
        status: params[:status]
      )

      if task.save
        { task: task }
      else
        { errors: task.errors.full_messages }
      end
    end
  end
end

