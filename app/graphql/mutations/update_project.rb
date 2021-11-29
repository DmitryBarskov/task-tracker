module Mutations
  class UpdateProject < BaseMutation
    argument :id, ID, required: true
    argument :name, String, required: false
    argument :description, String, required: false
    argument :user_ids, [ID], required: false

    type Types::ProjectType

    def resolve(**options)
      project = ::Project.find_by(id: options[:id])
      if project.present?
        result = ::UpdateProject.call(
          project_params: options,
          current_user: current_user,
          project: ::Project.find_by(id: options[:id])
        )
        if result.success?
          result.project
        else
          nil
        end
      else
        nil
      end
    end
  end
end
