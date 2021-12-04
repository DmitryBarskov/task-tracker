class TaskPolicy < ApplicationPolicy
  alias_method :task, :record # the same as
  # def task
  #   record
  # end

  def index?
    user.present?
  end

  def show?
  end

  def create?
    task.project.user_id == user.id
  end

  relation_scope do |relation|
    relation.where(project: user.projects)
  end
end
