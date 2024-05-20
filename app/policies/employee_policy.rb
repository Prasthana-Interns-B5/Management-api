# frozen_string_literal: true

# class Scope < Scope
#   # NOTE: Be explicit about which records you allow access to!
#   def resolve
#     scope.all
#   end
# end

class EmployeePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      # TODO: This would be restricted once the roles and care tem is implemented.
      scope.all
    end
  end

  def index?
    user.ur_hr?
  end

  def show?
    user.ur_hr? || user.manager?
  end

  def update?
    user.ur_hr?
  end

  def create?
    user.ur_hr?
  end

  def destroy?
    user.ur_hr?
  end

  def subordinates?
    true
  end

  def all_employees
    true
  end

  def queries?
    true
  end

  def scores?
    true
  end

  def managers?
    true
  end

  def role?
    true
  end
end
