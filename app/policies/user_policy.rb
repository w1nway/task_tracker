class UserPolicy < ApplicationPolicy
  authorize :user, allow_nil: true

  def new?
    create?
  end

  def create?
    !user.present?
  end
end