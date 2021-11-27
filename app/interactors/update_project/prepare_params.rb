class UpdateProject
  class PrepareParams
    include Interactor

    delegate :current_user, :project_params, :project_id, to: :context

    def call
      context.prepared_project_params = prepared_project_params
    end

    private

    def prepared_project_params
      project_params.merge(
        {
          id: project_id
        }
      )
    end
  end
end
