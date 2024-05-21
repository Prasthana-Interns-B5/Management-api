class Employee < ApplicationRecord
  validates :name, :role, presence: true

  has_many :questions
  has_many :answers
  has_many :employee_points
  has_many :feedbacks
  has_one :user, dependent: :destroy
  has_many :one_on_ones, class_name: 'OneOnOne', foreign_key: 'team_member_id'
  has_many :team_one_on_ones, class_name: 'OneOnOne'
  belongs_to :manager, class_name: 'Employee', optional: true, foreign_key: 'reporting_manager_id'
  after_create_commit :create_user

  def create_user
    user = User.find_by(email: email)
    return user.update!(employee: self, mobile_number: mobile_number, role: role) if user

    User.create!(employee: self, email: email, password: Devise.friendly_token(8), mobile_number: mobile_number, role: role)
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
    return if current_user.hr? || !current_user.manager?

    where_conditions << 'reporting_manager_id = :reporting_manager_id'
    where_values[:reporting_manager_id] = current_user.employee.id
  end

  def self.filter_by_name(query, where_conditions, where_values)
    return unless params[:query].present?

    where_conditions << 'LOWER(name) LIKE :query '
    where_values[:query] = "%#{query}%"
  end

  def team_members
    Employee.where(reporting_manager_id: id)
  end

  def can_view_employee?(user, record)
    return true if ReferenceDatum::EMPLOYEE_CREATE_ROLES.include?(user.role)

    if user.manager?
      record.team_members.pluck(:id).include?(user.employee_id)
    else
      user.employee.reporting_manager_id == record.id
    end
  end
end
