class Feedback < ApplicationRecord
  belongs_to :employee
  before_validation :set_employee_id

  private
  def set_employee_id 
    self.employee_id=Current.employee.id
  end

end
