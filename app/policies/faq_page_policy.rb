class FaqPagePolicy < ApplicationPolicy
  def edit?
    user&.admin? || user&.helper?
  end

  def update?
    user&.admin? || user&.helper?
  end
end
