# frozen_string_literal: true

class EmployeePoint < ApplicationRecord
  belongs_to :employee

  before_create :save_manager_id

  def save_manager_id
    self.manager_id = Current.employee.reporting_manager_id
  end
end
