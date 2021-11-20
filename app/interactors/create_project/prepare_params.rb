class CreateProject
  class PrepareParams
    include Interactor

    delegate :current_user, :project_params, to: :context

    def call
      context.prepared_project_params = prepared_project_params
    end

    private

    def prepared_project_params
      project_params.merge(
        {
          user_ids: user_ids
        }
      )
    end

    def user_ids
      project_params[:user_ids].push(current_user.id.to_s).uniq
    end
  end
end
