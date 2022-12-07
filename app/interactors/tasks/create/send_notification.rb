module Tasks
  class Create
    class SendNotification
      include Interactor

      delegate :task, to: :context
      delegate :project, to: :task

      def call
        TaskMailer.task_created_to_owner(project, task).deliver_later
        TaskMailer.task_created_to_members(project, task).deliver_later
      end
    end
  end
end
