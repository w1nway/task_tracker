class TaskMailer < ApplicationMailer
  def task_created_to_members(project, task)
    @project = project
    @task = task

    mail(to: project.users.where(project_memberships: { role: :member }).pluck(:email))
  end

  def task_created_to_owner(project, task)
    @project = project
    @task = task

    mail(to: project.users.where(project_memberships: { role: :owner }).pluck(:email))
  end

  def task_updated(project, task)
    @project = project
    @task = task

    mail(to: project.users.pluck(:email))
  end

  def task_destroyed_to_initiator(project, task, user)
    @project = project
    @task = task

    mail(to: user.email)
  end

  def task_destroyed_to_owner(project, task)
    @project = project
    @task = task

    mail(to: project.users.where(project_memberships: { role: :owner }).pluck(:email))
  end

  def task_destroyed_to_members(project, task, user)
    @project = project
    @task = task

    recipients = project.users.where(project_memberships: { role: :member }).where.not(id: user).pluck(:email)

    mail(to: recipients)
  end
end
