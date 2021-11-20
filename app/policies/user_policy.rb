class UserPolicy < ApplicationPolicy

  def show?
    user.present?
  end

  def create?
    true
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end