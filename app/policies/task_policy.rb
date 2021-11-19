class TaskPolicy < ApplicationPolicy
  alias_method :task, :record

  def index?
    true
  end

  def create?
    user.present?
  end

  def update?
    task.user_id.in?(project.users.ids)
  end

  def destroy?
    update?
  end

  def show?
    user.present?
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end