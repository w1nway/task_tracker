class CommentPolicy < ApplicationPolicy
  def update?
    member?
  end

  def edit?
    member?
  end

  def create?
    member?
  end

  def destroy?
    member?
  end

  private 

  def member?
    ProjectMembership.find_by(project: record.task.project, user: user).present?
  end

end