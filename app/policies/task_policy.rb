class TaskPolicy < ApplicationPolicy
  alias_method :task, :record

  def index?
    true
  end

  def show?
    task.project.user_ids.include?(user.id)
  end

  def create?
    user.present?
  end

  def update?
    show?
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
