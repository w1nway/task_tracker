module Tasks
  class Update
    class SendNotification
      include Interactor

      delegate :project, :task, to: :context

      def call
        TaskMailer.task_updated(project, task).deliver_later
      end
    end
  end
end
