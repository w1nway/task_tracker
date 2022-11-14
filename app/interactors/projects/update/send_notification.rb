module Projects
  class Update
    class SendNotification
      include Interactor

      delegate :project, to: :context

      def call
        ProjectMailer.project_updated(project).deliver_later
      end
    end
  end
end
