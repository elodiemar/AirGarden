class ReviewPolicy < ApplicationPolicy
  def create?
    true
  end
  def dashboard?
    true
  end
end
