module Comments
  class PrepareParams
    include Interactor

    delegate :comment_params, :task, :user, to: :context

    def call 
      context.prepared_params = prepared_params

      context.fail!(error: "Invalid data") unless context.prepared_params != prepared_params

      private 

      def prepared_params
        comment_params.merge({ task: task, user: user })
      end
    end
  end
end
