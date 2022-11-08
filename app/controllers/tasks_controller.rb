class TasksController < ApplicationController
  before_action :authenticate_current_user!
  before_action :set_task, only: %i[show edit update destroy]
  before_action :set_project
  before_action -> { authorize! @task }, only: %i[show edit update destroy]

  def index
    @task = Task.new(project: @project)
    authorize! @task

    @tasks = @project.tasks
  end

  def new
    @task = Task.new(project: @project)
    authorize! @task
  end

  def create
    @task = Task.new(task_params.merge({ project: @project }))
    authorize! @task

    if @task.save
      redirect_to project_task_path(@project, @task), notice: "Task was successfully created!"
    else
      render :new
    end
  end

  def destroy
    @task.destroy
    redirect_to @project, notice: "Task was successfully destroyed."
  end

  def show
    @comment = Comment.new
    @comments = @task.comments
  end

  def edit
  end

  def update
    if @task.update(task_params)
      redirect_to project_task_path(@project, @task), notice: "Task was successfully updated."
    else
      render :edit
    end
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def set_project
    @project = Project.find(params[:project_id])
  end

  def task_params
    params.require(:task).permit(:title, :description, :deadline_at)
  end
end
