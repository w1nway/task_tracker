class ProjectsController < ApplicationController
  before_action :set_project, only: %i[show edit update destroy]
  before_action -> { authorize! Project }, only: %i[index new create show]
  before_action -> { authorize! @project }, only: %i[edit update destroy]

  # GET /projects
  def index
    @projects = Project.all
                       .order(params[:sort])
                       .page(params[:page])
                       .per(5)
    respond_to do |format|
      format.html { render :index }
      format.json do
        render json: { projects: @projects }
      end
    end
  end

  # GET /projects/1
  def show
  end

  # GET /projects/new
  def new
    @project = Project.new
  end

  # GET /projects/1/edit
  def edit
    respond_to do |format|
      format.html { render :edit }
      format.json do
        render json: { project: @project }
      end
    end
  end

  # POST /projects
  def create # rubocop:disable Metrics/MethodLength
    @project = create_project.project
    respond_to do |format|
      if create_project.success?
        format.html { redirect_to @project, notice: "Project was successfully created." }
        format.json do
          render json: { project: @project, errors: @project.errors }
        end
      else
        format.html { render :new, notice: "Something went wrong. Try again" }
        format.json do
          render json: { project: {}, errors: @project.errors }
        end
      end
    end
  end

  # PATCH/PUT /projects/1
  def update
    @project = update_project.project

    if update_project.success?
      redirect_to @project, notice: "Project was successfully updated."
    else
      render :edit
    end
  end

  # DELETE /projects/1
  def destroy
    if destroy_project.success?
      redirect_to projects_path, notice: "Project was successfully destroyed."
    else
      redirect_to projects_path, notice: "Failed to destroy project"
    end
  end

  private

  def create_project
    @create_project ||=
      Projects::Create.call(project_params: project_params, user: current_user)
  end

  def update_project
    @update_project ||=
      Projects::Update.call(project_params: project_params, project: @project)
  end

  def destroy_project
    @destroy_project ||=
      Projects::Destroy.call(project: @project)
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_project
    @project = Project.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def project_params
    params.require(:project).permit(:name, :description)
  end
end
