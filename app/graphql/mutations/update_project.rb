module Mutations
  class UpdateProject < BaseMutation
    argument :project_id, ID, required: true
    argument :name, String, required: true
    argument :description, String, required: false
    argument :user_ids, [ID], required: false

    type Types::ProjectType

    def resolve(**_options)
      result = ::UpdateProject.call(
        project_params: _options.slice(:name, :description, :user_ids),
        current_user: current_user,
        project_id: _options[:project_id]
      )

      if result.success?
        result.project
      else
        nil
      end
    end
  end
end
