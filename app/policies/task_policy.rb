class TaskPolicy < ApplicationPolicy
  def index?
    member?
  end

  def new?
    create?
  end

  def create?
    member?
  end

  def destroy?
    member?
  end

  def show?
    member?
  end

  def edit?
    update?
  end

  def update?
    member?
  end

  private

  def member?
    ProjectMembership.find_by(project: record.project, user: user).present?
  end
end
