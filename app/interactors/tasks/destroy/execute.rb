module Tasks
  class Destroy
    class Execute
      include Interactor

      delegate :task, to: :context

      def call
        context.fail!(error: "Invalid Data") unless task.destroy
      end
    end
  end
end
