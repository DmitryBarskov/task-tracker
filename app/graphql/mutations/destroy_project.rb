module Mutations
  class DestroyProject < BaseMutation
    argument :id, ID, required: true

    type Types::ProjectType

    def resolve(**params)
      project = ::Project.find_by(id: params[:id])

      if project.present?
        result = ::DestroyProject.call(
          current_user: current_user,
          project: project
        )
        result.project
      end
    end
  end
end
