class OneOnOnePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      # TODO: This would be restricted once the roles and care tem is implemented.
      scope.all
    end
  end

  def index?
    true
  end

  def create?
    user.roles.any? { |role| %w[ur_manager].include?(role) }
  end

  def update?
    true
  end

  def destroy?
    user.roles.any? { |role| %w[ur_manager].include?(role) }
  end
end
