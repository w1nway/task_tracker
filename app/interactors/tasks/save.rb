module Tasks
  class Save
    include Interactor

    delegate :prepared_params, to: :context

    def call
      context.task = task

      context.fail!(error: "Invalid data") unless task.save
    end

    private

    def task
      @task ||= Task.new(prepared_params)
    end
  end
end
