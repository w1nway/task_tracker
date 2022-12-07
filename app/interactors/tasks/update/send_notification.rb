module Tasks
  class Update
    class SendNotification
      include Interactor

      delegate :task, to: :context
      delegate :project, to: :task

      def call
        TaskMailer.task_updated(project, task).deliver_later
      end
    end
  end
end
