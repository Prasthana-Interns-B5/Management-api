class OneOnOneSerializer < ActiveModel::Serializer
  attributes :id, :employee_id, :member_id, :date, :time, :repeat_monthly, :notes
  attribute :employee_attributes 
  def employee_attributes
    object.employee_attributes
  end

  def time
    self.object.time.strftime("%I:%M%p")
  end
end
