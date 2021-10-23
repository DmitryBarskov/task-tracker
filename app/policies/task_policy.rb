class TaskPolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    user.present?
  end

  def create?
    user.present?
  end

  def update?
    user.present?
  end

  def destroy?
    update?
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
