class EmployeeSimpleSerializer < ActiveModel::Serializer
  attributes :id, :name, :email
end
