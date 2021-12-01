class UpdateProject
  class SaveRecord
    include Interactor

    delegate :prepared_project_params, :project, to: :context


    def call
      context.project = project
      context.fail!(error: "Invalid data") unless project.update(prepared_project_params)
    end
    
  end
end