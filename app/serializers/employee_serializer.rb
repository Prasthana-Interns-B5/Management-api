class EmployeeSerializer < ActiveModel::Serializer
  attributes :id, :employee_no, :name, :email, :designation
  has_one :manager, serializer: EmployeeSerializer
end

