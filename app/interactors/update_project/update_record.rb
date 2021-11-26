class UpdateProject
  class UpdateRecord
    include Interactor

    delegate :prepared_project_params, :project_obj, to: :context

    def call
      context.project = project_obj
      unless project_obj.update(prepared_project_params)
        context.fail!(error: "Invalid data")
      end
    end
  end
end
