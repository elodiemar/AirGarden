class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
      # @boo = policy_scope(garden)
    end
  end

  def show?
    true
  end

  def create?
    true
  end

  def update?
    record.user == user || record.garden.user == user
  end

  def destroy?
    record.user == user || record.garden.user == user
  end
end
