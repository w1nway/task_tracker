module Tasks
  class Save 
    include Interactor

    delegate :task_params, :project, to: :context

    def call 
      context.project.task = task

      context.fail!(error: "Invalid data") unless task.save

      private 

      def task
        @task ||= Task.new(task_params)
      end
    end
  end
end
