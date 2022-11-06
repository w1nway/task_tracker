class ProjectPolicy < ApplicationPolicy
  authorize :user, allow_nil: true

  def index?
    true
  end

  def show?
    true
  end

  def new?
    create?
  end

  def create?
    user.present?
  end

  def edit?
    update?
  end

  def update?
    record.project_memberships.find_by(user: user).role = 'member' && user.present?
  end

  def destroy?
    record.project_memberships.find_by(user: user).role == 'owner' && user.present?
  end
end