module Tasks
  class Destroy
    class Execute
      include Interactor

      delegate :project, :task, :user, to: :context

      def call
        mail_to_owner.deliver_later unless user_is_owner?
        TaskMailer.task_destroyed_owner(project, task, current_user).deliver_later
        TaskMailer.task_destroyed_notification(project, task, current_user).deliver_later
      end

      private

      def mail_to_owner
        TaskMailer.task_destroyed_owner(project, task)
      end

      def user_is_owner?
        ProjectMembership.find_by(project: project, user: user).owner?
      end
    end
  end
end
