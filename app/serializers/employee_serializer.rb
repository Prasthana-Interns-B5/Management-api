class EmployeeSerializer < ActiveModel::Serializer
  attributes :id, :employee_no, :name, :email, :role, :manager_name, :manager_id

end
