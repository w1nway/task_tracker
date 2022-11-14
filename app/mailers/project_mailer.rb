class ProjectMailer < ApplicationMailer
  def project_created(project, user)
    @project = project

    mail(to: user.email)
  end

  def project_updated(project)
    @project = project

    mail(to: project.users.pluck(:email))
  end

  def project_destroyed(project)
    @project = project

    mail(to: project.users.pluck(:email))
  end
end
