class CommentsController < ApplicationController
  before_action :set_task, only: %i[show edit update destroy]
  before_action :set_comment, only: %i[create destroy update]

  def new
    @comment = Comment.new
  end

  def create
    # @task = Task.find(params[:task_id])
    # @comment = @task.comments.create(comment_params)
    @comment = Comment.new(comment_params)

    if @comment.save
      redirect_to project_task_path(@project, @task), notice: "Comment was successfully created!"
    else
      flash.now[:notice] = "Something went wrong. Try again."
    end
  end

  def destroy
    @task = @Task.find(params[:task_id])
    @comment = Comment.find(params[:id])
    @comment.destroy

    redirect_to project_task_url(@task.project, @task), notice: "Comment was successfully destroyed."
  end

  def edit
  end

  def update
    @task = Task.find(params[:task_id])
    @comment = Comment.find(params[:id])

    if @comment.update(comment_params)
      redirect_to project_task_url(@task.project, @task), notice: "Comment was successfully updated."
    else
      flash.now[:notice] = "Something went wrong. Try again."
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
    params.require(:comment).permit(:content, :task_id, :user_id)
  end
end
