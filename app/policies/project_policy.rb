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
    project.user_ids.include? user.id
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
