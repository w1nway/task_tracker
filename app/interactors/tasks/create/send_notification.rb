module Tasks
  class Create 
    class SendNotification
      include Interactor
      
      delegate :project, :task, :user, to: :context

      def call 
        TaskMailer.owner_task_created(project, task).deliver_later
        TaskMailer.member_task_created(project, task).deliver_later
      end
    end
  end
end
