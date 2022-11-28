class TaskMailer < ApplicationMailer
  def owner_task_created(project, task)
    @project = project
    @task = task

    mail(to: project.users.where(project_memberships: { role: :owner }).pluck(:email))
  end

  def member_task_created(project, task)
    @project = project
    @task = task

    mail(to: project.users.where(project_memberships: { role: :member }).pluck(:email))
  end

  def task_updated(project, task)
    @project = project
    @task = task

    mail(to: project.users.pluck(:email))
  end

  def task_destroyed_user(project, task, current_user)
    @project = project
    @task = task

    mail(to: current_user.email)
  end

  def task_destroyed_owner(project, task)
    @project = project
    @task = task

    mail(to: project.users.where(project_memberships: { role: :owner }).pluck(:email))
  end

  def task_destroyed_notification(project, task, current_user)
    @project = project
    @task = task

    company = project.users.where(project_memberships: { role: :member }).where.not(id: current_user).pluck(:email)

    mail(to: company)
  end
end
