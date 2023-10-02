class PostPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  def create?
    user&.id
  end

  def update?
    user&.id == record.user.id || user&.admin? || user.has_role?(:moderator)
  end

  def destroy?
    user&.id == record.user.id || user&.admin?
  end
end
