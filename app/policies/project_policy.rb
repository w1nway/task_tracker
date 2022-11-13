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
    user.present? && ProjectMembership.find_by(project: record, user: user).present?
  end

  def destroy?
    user.present? && record.project_memberships.find_by(user: user, role: :owner).present?
  end
end