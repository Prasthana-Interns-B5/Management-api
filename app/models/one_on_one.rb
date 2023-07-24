class OneOnOne < ApplicationRecord
  before_save :save_employee_id
  has_many :reviews
  accepts_nested_attributes_for :reviews
  private
  def save_employee_id
    self.employee_id = Current.employee.id
  end
end