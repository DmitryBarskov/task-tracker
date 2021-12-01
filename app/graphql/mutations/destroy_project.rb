module Mutations
  class DestroyProject < BaseMutation
    argument :id, ID, required: true

    type Types::ProjectType

    def resolve(**options)
      project = ::Project.find_by(id: options[:id])
      
      if project.present?
        result = project.destroy
      else
        nil
      end
    end
  end
end
