module Projects
  class Create
    class SendNotification
      include Interactor

      delegate :project, :user, to: :context

      def call
        ProjectMailer.project_created(project, user).deliver_later
      end
    end
  end
end
