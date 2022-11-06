class TaskPolicy < ApplicationPolicy
  authorize :user, allow_nil: true

  def index?
    is_a_member?
  end

  def show?
    is_a_member?
  end

  def new?
    create?
  end

  def create?
    is_a_member?
  end

  def edit?
    update?
  end

  def update?
    is_a_member?
  end

  def destroy?
    is_a_member?
  end

  private

  def is_a_member?
    user.present? && ProjectMembership.find_by(project: record.project, user: user).present? 
  end
end