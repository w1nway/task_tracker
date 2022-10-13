class TasksController < ApplicationController
  before_action :set_task, only: %i[show edit update destroy]
  before_action :set_project, only: %i[new index create destroy]

  def index
    @tasks = @project.tasks
                     .order(params[:sort])
                     .page(params[:page])
                     .per(5)
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.deadline_at = 7.days.after

    if @task.save
      redirect_to project_task_url(@project, @task), notice: "Task was successfully created!"
    else
      flash.now[:notice] = "Something went wrong. Try again."
      render :new
    end
  end

  def destroy
    @task.destroy
    redirect_to @project, notice: "Task was successfully destroyed."
  end

  def show
  end

  def edit
  end

  def update
    if @task.update(task_params)
      redirect_to project_task_url(@task.project, @task), notice: "Task was successfully updated."
    else
      flash.now[:notice] = "Something went wrong. Try again."
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
    params.require(:task).permit(:title, :description, :deadline_at, :project_id)
  end
end
