class OneOnOneSerializer < ActiveModel::Serializer
  attributes :id, :start_date_time, :end_date_time, :status, :notes
  belongs_to :participant, serializer: EmployeeSimpleSerializer
end
