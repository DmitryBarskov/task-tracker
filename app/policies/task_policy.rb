class TaskPolicy < ApplicationPolicy
  alias_method :task, :record

  def index?
    true
  end

  def show?
    user.present?
  end

  def create?
    show?
  end

  def update
    user.id == task.user_id
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
