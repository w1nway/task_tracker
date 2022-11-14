module Tasks
  class Update
    include Interactor

    delegate :task_params, to: :context

    def call
      context.update
      context.fail!(error: "Error") unless task.update

      if context.success?
        ProjectMailer.with(user: current_user).task_updated.deliver_later
      end
    end

    private 

    def update
      @project.update(project_params)
    end
  end
end