module Mutations
  class CreateProject < BaseMutation
    argument :name, String, required: true
    argument :description, String, required: false
    argument :user_ids, [ID], required: false

    type Types::ProjectType

    def resolve(**options)
      result = ::CreateProject.call(
        project_params: options,
        current_user: current_user
      )

      if result.success?
        result.project
      else
        format_errors project: result.project
      end
    end
  end
end
