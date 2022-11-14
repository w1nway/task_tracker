class CommentsController < ApplicationController
  before_action :authenticate_current_user!
  before_action :set_comment, only: %i[edit update destroy]
  before_action :set_task
  before_action :set_project
  before_action -> { authorize! @comment }, only: %i[edit update destroy]

  def create
    authorize! Comment.new(task: @task)

    @comment = create_comment.comment
    if create_comment.success?
      redirect_to project_task_path(@project, @task), notice: "Comment was successfully created!"
    else
      flash.now[:notice] = "Something went wrong. Try again."
      render "tasks/show"
    end
  end

  def destroy
    if destroy_comment.success?
      redirect_to project_task_path(@project, @task), notice: "Comment was successfully destroyed."
    else
      flash.now[:notice] = "Something went wrong. Try again."
      render "tasks/show"
    end
  end

  def edit
  end

  def update
    @comment = update_comment.comment
    if update_comment.success?
      redirect_to project_task_path(@project, @task),
                  notice: "Comment was successfully updated."
    else
      flash.now[:notice] = "Something went wrong. Try again."
      render :edit
    end
  end

  private

  def create_comment
    @create_comment ||=
      Comments::Create.call(comment_params: comment_params, user: current_user, task: @task)
  end

  def update_comment
    @update_comment ||=
      Comments::Update.call(comment: @comment, comment_params: comment_params)
  end

  def destroy_comment
    @destroy_comment ||=
      Comments::Destroy.call(comment: @comment)
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def set_task
    @task = Task.find(params[:task_id])
  end

  def set_project
    @project = Project.find(params[:project_id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end
