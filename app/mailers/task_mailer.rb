class TaskMailer < ApplicationMailer
  def owner_task_created(project, task)
    @project = project
    @task = task
    @owner = ProjectMembership.find_by(project: @project, role: :owner).user

    mail(to: owner.email.pluck(:email))
  end

  def member_task_created(project, task)
    @project = project
    @task = task

    for user in project.users do
      if user.role == 'member'
        @member = user
        mail(to: member.email.pluck(:email))
      end
    end
  end

  def task_updated(project, task)
    @project = project 
    @task = task

    mail(to: project.users.pluck(:email))
  end

  def task_destroyed_by_user(project, task, user)
    @project = project 
    @task = task

    mail(to: user.email)
  end

  def task_destroyed_by_owner(project, task)
    @project = project 
    @task = task 
    @owner = ProjectMembership.find_by(project: @project, role: :owner).user

    mail(to: owner.email.pluck(:email))
  end

  def task_destroyed_notification(project, task, current_user)
    @project = project
    @task = task
    
    for user in project.users do
      if user.role == 'member' && user != current_user
        @member = user
        mail(to: member.email.pluck(:email))
      end
    end
  end
end
