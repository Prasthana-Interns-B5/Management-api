class EmployeeSerializer < ActiveModel::Serializer
  attributes :id, :email, :role, :manager_id
  # belongs_to :manager
  # has_many :subordinates, if: :manager_id_exists

  # def manager_id_exists
  #   self.manager_id.nil?
  # end
end
