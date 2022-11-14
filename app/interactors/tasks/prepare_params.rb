module Tasks
  class PrepareParams
    include Interactor

    delegate :task_params, :project, to: :context

    def call
      context.prepared_params = prepared_params
    end

    private

    def prepared_params
      task_params.merge({ project: project })
    end
  end
end
