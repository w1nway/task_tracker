module Api
  module V1
    class ProjectsController < Api::ApplicationController
      def index
        @projects = Project.all
                           .order(params[:sort])
                           .page(params[:page])
                           .per(5)

        render json: { projects: @projects }
      end

      def create
        @project = create_project.project
        if create_project.success?
          render json: { project: @project, errors: @project.errors }
        else
          render json: { project: {}, errors: @project.errors }
        end
      end

      private

      def create_project
        @create_project ||=
          Projects::Create.call(project_params: project_params, user: current_user)
      end

      # Only allow a list of trusted parameters through.
      def project_params
        params.require(:project).permit(:name, :description)
      end
    end
  end
end
