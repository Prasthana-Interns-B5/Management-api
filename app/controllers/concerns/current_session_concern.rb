module CurrentSessionConcern
  extend ActiveSupport::Concern

  def employee_permissions
    {
      'employee.index': policy(Employee).index?,
      'employee.create': policy(Employee).create?,
      'employee.show': policy(Employee).show?,
      'employee.update': policy(Employee).update?,
      'employee.destroy': policy(Employee).destroy?
    }
  end

  def one_on_one_permissions
    {
      'one_on_one.index': policy(OneOnOne).index?,
      'one_on_one.create': policy(OneOnOne).create?,
      'one_on_one.show': policy(OneOnOne).show?,
      'one_on_one.update': policy(OneOnOne).update?,
      'one_on_one.destroy': policy(OneOnOne).destroy?
    }
  end

  def employee_points_permissions
    {
      'employee_points.index': true,
      'employee_points.create': true,
      'employee_points.show': true,
      'employee_points.update': true,
      'employee_points.destroy': true
    }
  end
end
