module Projects
  class Destroy
    class Execute
      include Interactor

      delegate :project, to: :context

      def call
        context.fail!(error: "Invalid data") unless project.destroy
      end
    end
  end
end
