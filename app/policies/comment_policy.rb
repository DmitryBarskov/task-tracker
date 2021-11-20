class CommentPolicy < ApplicationPolicy
  def create?
    record.task.project.user_ids.include? user.id
  end

  def update?
    record.user_id == user.id
  end

  def edit?
    update?
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
