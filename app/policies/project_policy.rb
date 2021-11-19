class ProjectPolicy < ApplicationPolicy
  alias_method :project, :record

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
    project.user_id.in?(project.users.ids)
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
