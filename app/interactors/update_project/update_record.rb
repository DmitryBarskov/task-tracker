class UpdateProject
  class UpdateRecord
    include Interactor

    delegate :project_params, :project, to: :context

    def call
      unless project.update(project_params)
        context.fail!(error: "Invalid data")
      end
      
    end
  end
end