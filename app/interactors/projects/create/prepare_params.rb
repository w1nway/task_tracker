module Projects
  class Create
    class PrepareParams
      include Interactor

      delegate :project, to: :context

      def call
        ProjectMailer.project_created(project, user).deliver_later
      end
    end
  end
end
