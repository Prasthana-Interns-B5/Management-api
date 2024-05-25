class EmployeePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def permitted_attributes
    %i[email name designation reporting_manager_id employee_no mobile_number]
  end

  def index?
    user.is_admin || user.manager?
  end

  def show?
    (record.id == user.employee_id) || record.can_view_employee?(user)
  end

  def update?
    (record.id == user.employee_id) || create?
  end

  def create?
    create_permission[:access] == KEY_ENABLED
  end

  def destroy?
    create?
  end

  def create_permission
    if user.is_admin
      if user.active
        { access: ReferenceDatum::KEY_ENABLED }
      else
        { access: ReferenceDatum::KEY_DISABLED }
      end
    else
      { access: ReferenceDatum::KEY_NOT_AVAILABLE }
    end
  end

  def update_permission
    if update?
      { access: ReferenceDatum::KEY_ENABLED }
    else
      { access: ReferenceDatum::KEY_NOT_AVAILABLE }
    end
  end

  def destroy_permission
    create_permission
  end

  def index_permission
    if index?
      { access: ReferenceDatum::KEY_ENABLED }
    else
      { access: ReferenceDatum::KEY_NOT_AVAILABLE }
    end
  end
end
