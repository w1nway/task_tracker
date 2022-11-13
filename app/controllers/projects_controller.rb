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
    @project = create_project.project

    if create_project.success?
      redirect_to @project, notice: "Project was successfully created."
    else
      flash.now[:alert] = "Something went wrong. Try again."
      render :new
    end
  end

  # PATCH/PUT /projects/1
  # def update
  #   if @project.update(project_params)
  #     redirect_to @project, notice: "Project was successfully updated."
  #   else
  #     render :edit
  #   end
  # end

  def update
    result = Project::Update.call(project_params)

    if result.success?
      ProjectMailer.with(user:).project_updated.deliver_later
      redirect_to @project, notice: "Project was successfully updated."
    else
      render :edit
    end
  end


  # DELETE /projects/1
  # def destroy
  #   @project.destroy
  #   redirect_to projects_path, notice: "Project was successfully destroyed."
  # end

  def destroy
    result = Project::Destroy.call

    if result.success?
      ProjectMailer.with(user: current_user).project_destroyed.deliver_later
      redirect_to projects_path, notice: "Project was successfully destroyed."
    else
      flash.now[:alert] = "Something went wrong. Try again."
    end
  end

  private

  def create_project
    @create_project ||=
      Projects::Create.call(project_params: project_params, user: current_user)
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
