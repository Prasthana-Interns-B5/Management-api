# frozen_string_literal: true

class PointSerializer < ActiveModel::Serializer
  attributes :id, :employee_id, :month, :self_score, :manager_score, :manager_id, :avg_score

  def avg_score
    Point.where(employee_id: object.employee_id).pluck('avg(manager_score)')
  end
end
