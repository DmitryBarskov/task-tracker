class UserPolicy < ApplicationPolicy
  def show?
    user.present?
  end

  def create?
    true
  end
end
