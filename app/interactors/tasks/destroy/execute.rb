module Tasks 
  class Destroy
    class Execute 
      include Interactor 

      delegate :project, :task, to: :context

      def call 
        context.fail!(error: "Invalid data") unless task.destroy
      end
    end
  end
end
