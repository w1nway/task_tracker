class ProjectsController < ApplicationController
  before_action :set_project, only: %i[show edit update destroy]
  before_action -> { authorize! Project }, only: %i[index show new create]

  # GET /projects
  def index
    @projects = Project.all
                       .order(params[:sort])
                       .page(params[:page])
                       .per(5)
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
  end

  # POST /projects
  def create
    @project = Project.new(project_params)
    @project_membership = ProjectMembership.new(project_membership_params)

    if @project.save && @project_membership.save
      redirect_to @project, notice: "Project was successfully created."
    else
      @project.destroy
      flash.now[:alert] = "Something went wrong. Try again."
      render :new
    end
  end

  # PATCH/PUT /projects/1
  def update
    if @project.update(project_params)
      redirect_to @project, notice: "Project was successfully updated."
    else
      render :edit
    end
  end

  # DELETE /projects/1
  def destroy
    @project.destroy
    redirect_to projects_url, notice: "Project was successfully destroyed."
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_project
    @project = Project.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def project_params
    params.require(:project).permit(:name, :description)
  end

  def project_membership_params
    {
      project: @project,
      user: current_user,
      role: :owner
    }
  end
end
