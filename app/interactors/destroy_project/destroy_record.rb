class DestroyProject
  class DestroyRecord
    include Interactor

    delegate :project, to: :context

    def call
      context.project = project
      context.fail!(error: "Invalid data") unless project.destroy
    end
  end
end

