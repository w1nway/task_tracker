module Tasks
  class Update
    class Execute
      include Interactor

      delegate :task, :task_params, to: :context

      def call
        context.fail!(error: "Invalid Data") unless task.update(task_params)
      end
    end
  end
end
