class OneOnOne < ApplicationRecord
  before_save :save_employee_id

  private
  def save_employee_id
    self.employee_id = Current.employee.id
  end
  
end