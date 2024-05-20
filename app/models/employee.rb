class Employee < ApplicationRecord
  validates :name, :role, presence: true

  has_many :questions
  has_many :answers
  has_many :employee_points
  has_many :feedbacks
  has_one :user, dependent: :destroy
  has_many :one_on_ones, class_name: 'OneOnOne', foreign_key: 'team_member_id'
  has_many :team_one_on_ones, class_name: 'OneOnOne'
  has_many :subordinates, class_name: 'Employee', foreign_key: 'reporting_manager_id'
  belongs_to :manager, class_name: 'Employee', optional: true


  def create_user
    user = User.new(employee: self, email: email, password: Devise.friendly_token(8), mobile_number: mobile_number)
    user.role << role
    user.save!
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

  ROLES = %w[ur_hr ur_manager ur_sr_software ur_lead ur_software_engineer].freeze
  validates :role, inclusion: { in: ROLES,
                                message: '%<value>s is not valid.' }
  ROLES.each do |role_name|
    define_method "#{role_name}?" do
      role == role_name
    end
  end
end
