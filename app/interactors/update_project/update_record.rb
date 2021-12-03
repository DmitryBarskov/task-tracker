class UpdateProject
  class UpdateRecord
    include Interactor

    delegate :current_user, :project_params, :project, to: :context

    def call
      context.fail!(error: "Invalid data") unless project.update(project_params)
    end
  end
end
