module Api
  module V1
    class TasksController < Api::ApplicationController
      before_action :set_project

      def index
        @tasks = @project.tasks
        render json: { tasks: @tasks }
      end

      def create
        @task = create_task.task
        if create_task.success?
          render json: { task: @task, errors: @task.errors }
        else
          render json: { task: {}, errors: @task.errors }
        end
      end

      def update
        @task = update_task.task

        if update_task.success?
          render json: { task: @task, errors: @task.errors }
        else
          render json: { task: {}, errors: @task.errors }
        end
      end

      def destroy
        if destroy_task.success?
          render json: { task: @task, errors: @task.errors }
        else
          render json: { task: {}, errors: @task.errors }
        end
      end

      private

      def create_task
        @create_task ||= Tasks::Create.call(task_params: task_params, project: @project)
      end

      def update_task
        @update_task ||= Tasks::Update.call(task_params: task_params, task: @task)
      end

      def destroy_task
        @destroy_task ||= Tasks::Destroy.call(task: @task, user: current_user)
      end

      def set_project
        @project = Project.find(params[:project_id])
      end

      def task_params
        params.require(:task).permit(:title, :description, :deadline_at)
      end
    end
  end
end
