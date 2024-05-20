# frozen_string_literal: true

class EmployeePointPolicy < ApplicationPolicy
  # class Scope < Scope
  #   # NOTE: Be explicit about which records you allow access to!
  #   # def resolve
  #   #   scope.all
  #   # end
  # end
  class Scope < Scope
    def resolve
      # TODO: This would be restricted once the roles and care tem is implemented.
      scope.all
    end
  end

  def index?
    true
  end

  def show?
    true
  end

  def manager_score?
    true
  end

  def create?
    true
  end

  def update?
    true
  end

  def destroy?
    true
  end
end
