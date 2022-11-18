module Tasks
  class Destroy
    class SendNotification
      include Interactor
      
      delegate :project, :task, :user, to: :context

      def call 
        TaskMailer.task_destroyed(task, user).deliver_later
      end
    end
  end
end
