class OneOnOne < ApplicationRecord
  validates :scheduled_date, :employee_id, :participant_id, :start_time, :end_time, presence: true
  has_many :reviews
  accepts_nested_attributes_for :reviews
  belongs_to :employee, class_name: 'Employee', foreign_key: 'employee_id'
  belongs_to :participant, class_name: 'Employee', foreign_key: 'participant_id'
  def can_view?(user)
    user.employee_id == employee_id || user.employee_id == participant_id
  end
end
