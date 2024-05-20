module CurrentSessionConcern
  extend ActiveSupport::Concern

  def employee_permissions
    {
      'employee.index': true,
      'employee.create': true,
      'employee.show': true,
      'employee.update': true,
      'employee.destroy': true
    }
  end

  def one_on_one_permissions
   {
     'one_on_one.index': true,
     'one_on_one.create': true,
     'one_on_one.show': true,
     'one_on_one.update': true,
     'one_on_one.destroy': true
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
