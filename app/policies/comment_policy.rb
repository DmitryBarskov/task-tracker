class CommentPolicy < ApplicationPolicy
  alias_method :comment, :record

  def create?
    true
  end

  def update?
    comment.user.id == user.id
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
