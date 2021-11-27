class UpdateProject
  class UpdateRecord
    include Interactor

    delegate :prepared_project_params, :project, to: :context

    def call
      unless project.update(prepared_project_params)
        context.fail!(error: "Invalid data")
      end
    end
  end
end
