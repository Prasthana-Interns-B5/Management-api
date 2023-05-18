class PointSerializer < ActiveModel::Serializer
  attributes :id, :month, :self_score, :manager_score

end
