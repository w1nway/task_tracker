class TaskMailer < ApplicationMailer
  def task_created(project, task, user)
    @project = project
    @task = task

    mail(to: user.email)
  end

  def task_updated(project, task, user)
    @project = project 
    @task = task

    mail(to: user.email)
  end

  def task_destroyed(project, task, user)
    @project = project 
    @task = task

    mail(to: user.email)
  end
end
