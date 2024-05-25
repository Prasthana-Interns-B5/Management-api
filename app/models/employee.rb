class Employee < ApplicationRecord
  validates :name, :designation, presence: true

  has_many :questions
  has_many :answers
  has_many :employee_points
  has_many :feedbacks
  has_one :user, dependent: :destroy
  belongs_to :manager, class_name: 'Employee', optional: true, foreign_key: 'reporting_manager_id'
  has_many :team_members, class_name: 'Employee', foreign_key: 'reporting_manager_id'
  has_many :one_on_ones, lambda { |employee|
    unscope(:where).where('employee_id = ? OR participant_id = ?', employee.id, employee.id)
  }, class_name: 'OneOnOne'
  after_create_commit :create_user

  default_scope { where('active = true') }

  def create_or_update_user
    user = User.find_by(email: email)
    return user.update!(employee: self, mobile_number: mobile_number, active: active) if user

    User.create!(employee: self, email: email, password: Devise.friendly_token(8), mobile_number: mobile_number, active: active)
  end

  def self.filter(current_user, params)
    where_conditions = []
    where_values = {}
    filter_by_user(current_user, where_conditions, where_values)
    filter_by_name(params[:query], where_conditions, where_values)

    if where_conditions.empty?
      Employee.all
    else
      Employee.where(where_conditions.join(' and '), where_values)
    end
  end

  def self.filter_by_user(current_user, where_conditions, where_values)
    return if current_user.is_admin

    where_conditions << 'reporting_manager_id = :reporting_manager_id'
    where_values[:reporting_manager_id] = current_user.employee.id
  end

  def self.filter_by_name(query, where_conditions, where_values)
    return unless query.present?

    where_conditions << 'LOWER(name) LIKE :query '
    where_values[:query] = "%#{query}%"
  end

  def can_view_employee?(user)
    return true if user.is_admin

    if user.manager?
      user.employee.team_members.pluck(:id).include?(id)
    else
      user.employee.reporting_manager_id == id
    end
  end
end
