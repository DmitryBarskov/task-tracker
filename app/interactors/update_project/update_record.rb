class UpdateProject
  class UpdateRecord
    include Interactor

    delegate :project_params, :project, to: :context

    def call
      context.project = project
      context.fail!(error: "Invalid data") unless project.update(project_params)
    end
  end
end
