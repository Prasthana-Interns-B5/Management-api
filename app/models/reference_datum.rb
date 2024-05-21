class ReferenceDatum < ApplicationRecord
  default_scope { order('data_type ASC, label ASC') }
  DATA_TYPES = %w[employee_role].freeze

  validates :data_type, :key, :label, presence: true
  validates :key, uniqueness: { case_sensitive: false }
  validates :data_type, inclusion: { in: DATA_TYPES }

  UR_HR = 'ur_hr'.freeze
  UR_ADMIN = 'ur_admin'.freeze
  UR_MANAGER = 'ur_manager'.freeze
  UR_LEAD = 'ur_lead'.freeze
  UR_SOFTWARE_ENGINEER = 'ur_software_engineer'.freeze
  UR_SR_SOFTWARE_ENGINEER = 'ur_sr_software_engineer'.freeze
  EMPLOYEE_CREATE_ROLES = [UR_HR, UR_ADMIN].freeze
end
