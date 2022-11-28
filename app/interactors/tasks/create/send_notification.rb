module Tasks
  class Create
    class SendNotification
      include Interactor

      delegate :project, :task, :user, to: :context

      def call
        TaskMailer.task_created_owner(project, task).deliver_later
        TaskMailer.task_created_member(project, task).deliver_later
      end
    end
  end
end
