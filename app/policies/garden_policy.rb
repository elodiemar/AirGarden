class GardenPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
      @garden = policy_scope(garden)
    end
  end

  def show?
    true
  end

  def create?
    true
  end

  def update?
    record.user == user
  end

  def destroy?
    record.user == user
  end
end
