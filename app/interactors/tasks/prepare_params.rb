module Tasks
  class PrepareParams
    include Interactor

    delegate :task_params, :project, to: :context

    def call 
      context.prepared_params = prepared_params

      context.fail!(error: "Invalid data") unless context.prepared_params != prepared_params

      private 

      def prepared_params
        task_params.merge({ project: project })
      end
    end
  end
end