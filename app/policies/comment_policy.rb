class CommentPolicy < ApplicationPolicy
  alias_method :comment, :record

  def create?
    user.id.in? comment.task.project.user_ids
    # user.present?
  end

  def update?
    comment.user_id == user.id
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
