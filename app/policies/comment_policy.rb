class CommentPolicy < ApplicationPolicy
  def create?
    user.present?
  end

  def update?
    user.present?
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
