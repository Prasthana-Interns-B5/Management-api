class ReferenceDatum < ApplicationRecord
  default_scope { order('data_type ASC, label ASC') }
  DATA_TYPES = %w[employee_role].freeze

  validates :data_type, :key, :label, presence: true
  validates :key, uniqueness: { case_sensitive: false }
  validates :data_type, inclusion: { in: DATA_TYPES }

  KEY_ENABLED = 'enabled'.freeze
  KEY_DISABLED = 'disabled'.freeze
  KEY_NOT_AVAILABLE = 'not_available'.freeze
end
