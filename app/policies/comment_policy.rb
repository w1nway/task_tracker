class CommentPolicy < ApplicationPolicy
  authorize :user, allow_nil: true

  def update?
    user.present?
  end

  def destroy?
    user.present?
  end
end