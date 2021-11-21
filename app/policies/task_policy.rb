class TaskPolicy < ApplicationPolicy
  alias_method :task, :record # the same as
  # def task
  #   record
  # end

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
    task.project.user_id == user.id
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
