class TaskPolicy < ApplicationPolicy
  def index?
    member?
  end

  def show?
    member?
  end

  def new?
    create?
  end

  def create?
    member?
  end

  def edit?
    update?
  end

  def update?
    member?
  end

  def destroy?
    member?
  end

  private

  def member?
    user.present? && ProjectMembership.find_by(project: record.project, user: user).present? 
  end
end