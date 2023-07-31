class DeviceToken < ApplicationRecord
  belongs_to :employee
  validates :token, presence: true, uniqueness: true
end
