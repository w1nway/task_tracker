module Tasks 
  class Update 
    class Execute 
      include Interactor 

      delegate :project, :task, :task_params, to: :context

      def call 
        context.fail!(error: "Invalid data") unless task.update(task_params)
      end
    end
  end
end
