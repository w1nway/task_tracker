class CommentPolicy < ApplicationPolicy
  authorize :user, allow_nil: true

  def update?
    is_a_member?
  end

  def edit?
    is_a_member?
  end

  def create?
    is_a_member?
  end

  def destroy?
    is_a_member?
  end

  private 

  def is_a_member?
    ProjectMembership.find_by(project: record.task.project, user: user).present?
  end

end