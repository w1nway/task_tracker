class ProjectMailer < ApplicationMailer
  def project_created(project, user)
    @project = project

    mail(to: user.email)
  end

  def project_updated(project, user)
    @project.update(project_params)

    mail(to: user.email)
  end

  def project_destroyed(project, user)
    @project.destroy

    mail(to: user.email)
  end
end
