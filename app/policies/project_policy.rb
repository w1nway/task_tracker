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
    user.present? && member?
  end

  def destroy?
    user.present? && owner?
  end

  private

  def member?
    ProjectMembership.find_by(project: record, user: user).present?
  end

  def owner?
    ProjectMembership.find_by(project: record, role: :owner, user: user).present?
  end
end
