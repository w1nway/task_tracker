module Tasks
  class Create
    class SendNotification
      include Interactor

      delegate :project, :task, to: :context

      def call
        TaskMailer.task_created_to_owner(project, task).deliver_later
        TaskMailer.task_created_to_members(project, task).deliver_later
      end
    end
  end
end
