class TasksController < ApplicationController
  before_action :authenticate_current_user!
  before_action :set_task, only: %i[show edit update destroy]
  before_action :set_project
  before_action -> { authorize! @task }, only: %i[show edit update destroy]
  before_action -> { authorize! Task.new(project: @project) }, only: %i[index new create]

  def index
    @tasks = @project.tasks
  end

  def new
    @task = Task.new
  end

  def create
    @task = create_task.task
    if create_task.success?
      redirect_to project_task_path(@project, @task), notice: "Task was successfully created!"
    else
      render :new
    end
  end

  def destroy
    if destroy_task.success?
      redirect_to @project, notice: "Task was successfully destroyed."
    else
      redirect_to project_tasks_path, notice: "Something went wrong. Try again."
    end
  end

  def show
    @comment = Comment.new
    @comments = @task.comments
    respond_to do |format|
      format.html { render :show }
      format.json do
        render json: { task: @task, comments: @comments }
      end
    end
  end

  def edit
  end

  def update
    @task = update_task.task
    if update_task.success?
      redirect_to project_task_path(@project, @task), notice: "Task was successfully updated."
    else
      render :edit
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
