class EmployeeTeamSerializer < ActiveModel::Serializer
  attributes :id, :name
  has_many :team_members, each_serializer: EmployeeSerializer
end
