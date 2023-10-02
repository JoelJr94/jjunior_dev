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
    user&.id == record.user.id or user&.admin?
  end

  def destroy?
    user&.id == record.user.id or user&.admin?
  end
end
