module Mutations
  class UpdateProject < BaseMutation
    argument :id, ID, required: true
    argument :name, String, required: false
    argument :description, String, required: false
    argument :user_ids, [ID], required: false

    type Types::ProjectType

    def resolve(**params)
      result = ::UpdateProject.call(
        project_params: params,
        current_user: current_user,
        project: ::Project.find_by(id: params[:id])
      )

      if result.success?
        result.project
      else
        nil
      end
    end
  end
end

