class UpdateProject
  class UpdateRecord
    include Interactor

    delegate :prepared_project_params, to: :context

    def call
      context.project = project
      context.project.assign_attributes(prepared_project_params)
      context.fail!(error: "Invalid data") unless context.project.save
    end

    private

    def project
      @project ||= Project.find_by!(id: prepared_project_params[:id])
    end
  end
end
