class Question < ApplicationRecord
  belongs_to :employee, optional: true
  has_many :answers, dependent: :destroy

  # before_create :save_manager_id, :save_employee_id

  # def save_manager_id
  #   self.manager_id = current_employee.manager_id
  # end

  # def save_manager_id
  #   self.employee_id = current_employee.id
  # end
end
