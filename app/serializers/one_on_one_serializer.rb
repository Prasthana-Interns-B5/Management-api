class OneOnOneSerializer < ActiveModel::Serializer
  attributes :id, :employee_id, :member_id, :date, :time, :repeat_monthly, :notes
  attribute :employee_attributes 
  def employee_attributes
    object.employee_attributes
  end
end
