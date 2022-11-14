module Comments
  class PrepareParams
    include Interactor

    delegate :comment_params, :user, :task, to: :context

    def call
      context.prepared_params = prepared_params
    end

    private

    def prepared_params
      comment_params.merge({ task: task, user: user })
    end
  end
end
