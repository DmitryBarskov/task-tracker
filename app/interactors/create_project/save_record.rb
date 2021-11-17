class CreateProject
  class SaveRecord
    include Interactor

    delegate :prepared_project_params, to: :context

    def call
      context.project = project
      context.fail!(error: "Invalid data") unless project.save 
    end

    private

    def project
      @project ||= Project.new(prepared_project_params)
    end
  end
end
