class PointSerializer < ActiveModel::Serializer
  attributes :id,:employee_id, :month, :self_score, :manager_score, :manager_id



end
