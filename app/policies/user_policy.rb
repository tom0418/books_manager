class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.admin?
        scope.all
      else
        scope.where(id: user.id)
      end
    end
  end

  def index?
    user.admin?
  end

  def show?
    record.id == user.id || user.admin?
  end

  def create?
    user.admin?
  end

  def new?
    create?
  end

  def update?
    record.id == user.id || user.admin?
  end

  def edit?
    update?
  end

  def destroy?
    user.admin?
  end
end
