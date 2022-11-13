module Projects
  class Destroy
    include Interactor

    delegate :project_params, to: :context

    def call
      context.destroy

      context.fail!(error: "Error") unless project.destroy
    end

    private 

    def destroy
      @project.destroy
    end
  end
end