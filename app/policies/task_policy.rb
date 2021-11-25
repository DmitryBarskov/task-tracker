class TaskPolicy < ApplicationPolicy
  alias_method :task, :record # the same as
  # def task
  #   record
  # end

  def index?
    user.present?
  end

  def create?
    task.project.user_id == user.id
  end
end
