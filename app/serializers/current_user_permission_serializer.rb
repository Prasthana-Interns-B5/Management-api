class CurrentUserPermissionSerializer < ActiveModel::Serializer
  attributes :id, :email, :permissions

  def permissions
    user = User.current_user
    employee_policy = EmployeePolicy.new(user, object)
    one_on_one_policy = OneOnOnePolicy.new(user, object)
    {
      'employees.create': employee_policy.create_permission,
      'employees.update': employee_policy.update_permission,
      'employees.destroy': employee_policy.destroy_permission,
      'employees.index': employee_policy.index_permission,
      'one_on_ones.create': one_on_one_policy.create_permission,
      'one_on_ones.update': one_on_one_policy.update_permission,
      'one_on_ones.destroy': one_on_one_policy.destroy_permission,
      'one_on_ones.index': one_on_one_policy.index_permission
    }
  end
end
