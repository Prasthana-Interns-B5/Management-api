class EmployeeSerializer < ActiveModel::Serializer
  attributes :id, :employee_no, :name, :email, :role, :manager_name, :manager_id
  # belongs_to :manager
  # has_many :subordinates, if: :manager_id_exists

  # def manager_id_exists
  #   self.manager_id.nil?
  # end
end
