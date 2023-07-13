class OneOnOneSerializer < ActiveModel::Serializer
  attributes :id, :employee_id, :member_id, :date, :time, :repeat_monthly, :notes
end
