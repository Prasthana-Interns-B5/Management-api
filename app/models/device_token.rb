class DeviceToken < ApplicationRecord
  belongs_to :employee
  device_types=%w{android ios}
  validates :device_type, inclusion: {in: device_types, message: "%{value} is not valid"}
end
