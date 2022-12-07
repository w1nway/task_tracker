module Tasks
  class Destroy
    class SendNotification
      include Interactor

      delegate :task, :user, to: :context
      delegate :project, to: :task

      def call
        mail_owner.deliver_later unless initiator_is_owner?
        TaskMailer.task_destroyed_to_initiator(project, task, user).deliver_later
        TaskMailer.task_destroyed_to_members(project, task, user).deliver_later
      end

      private

      def mail_owner
        TaskMailer.task_destroyed_to_owner(project, task)
      end

      def initiator_is_owner?
        ProjectMembership.find_by(project: project, user: user).owner?
      end
    end
  end
end
