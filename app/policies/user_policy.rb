class UserPolicy < ApplicationPolicy
  def create?
    true
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
