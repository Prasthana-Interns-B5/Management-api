class EmployeePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def permitted_attributes
    %i[email name role reporting_manager_id employee_no mobile_number]
  end

  def index?

  end

  def show?
    record.id == user.employee_id || record.can_view_employee?(user, record)
  end

  def update?
    if record.instance_of?(Employee)
      (record.id == user.employee_id) || create?
    else
      false
    end
  end

  def create?
    ReferenceDatum::EMPLOYEE_CREATE_ROLES.include?(user.role)
  end

  def destroy?
    true
  end
end
