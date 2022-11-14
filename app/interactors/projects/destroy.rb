module Projects
  class Destroy
    include Interactor

    delegate :project_params, to: :context

    def call
      context.destroy
      context.fail!(error: "Error") unless project.destroy

      if context.success?
        ProjectMailer.with(user: current_user).project_destroyed.deliver_later
      end
    end

    private 

    def destroy
      @project.destroy
    end
  end
end