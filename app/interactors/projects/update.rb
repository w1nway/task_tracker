module Projects
  class Update
    include Interactor

    delegate :project_params, to: :context

    def call
      context.update

      context.fail!(error: "Error") unless project.update
    end

    private 

    def update
      @project.update(project_params)
    end
  end
end