module Tasks
  class Create 
    class SendNotification
      include Interactor
      
      delegate :project, :task, :user, to: :context

      def call 
        TaskMailer.task_created(task, user).deliver_later
      end
    end
  end
end
