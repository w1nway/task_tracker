class CommentsController < ApplicationController
  before_action :authenticate_current_user!
  before_action :set_task, only: %i[edit update destroy create]
  before_action :set_comment, only: %i[edit destroy update]
  before_action :set_project, only: %i[create edit update destroy]
  before_action -> { authorize! @comment }, only: %i[edit destroy update]

  def create
    @comment = Comment.new(comment_params.merge({ task: @task, user: current_user }))
    authorize! @comment

    if @comment.save
      redirect_to project_task_path(@project, @task), notice: "Comment was successfully created!"
    else
      flash.now[:notice] = "Something went wrong. Try again."
      render 'tasks/show'
    end
  end

  def destroy
    @comment = @task.comments.find(params[:id]) 
    @comment.destroy

    redirect_to project_task_path(@project, @task), notice: "Comment was successfully destroyed."
  end

  def edit
  end

  def update
    if @comment.update(comment_params)
      redirect_to project_task_url(@task.project, @task), notice: "Comment was successfully updated."
    else
      flash.now[:notice] = "Something went wrong. Try again."
      render :edit
    end
  end

  private
  
  def set_task
    @task = Task.find(params[:task_id])
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end

  def set_project
    @project = Project.find(params[:project_id])
  end
end
