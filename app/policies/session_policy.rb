class SessionPolicy < ApplicationPolicy
  authorize :user, allow_nil: true

  def show?
    user.present?
  end

  def new?
    create?
  end

  def create?
    !user.present?
  end
end