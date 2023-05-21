class Answer < ApplicationRecord
  belongs_to :question
  belongs_to :employee, default: -> { Current.employee }

  before_create :save_employee_id

  def save_manager_id
    self.manager_id = Current.employee.manager_id
  end

  def save_employee_id
    self.employee_id = Current.employee.id
  end
end
