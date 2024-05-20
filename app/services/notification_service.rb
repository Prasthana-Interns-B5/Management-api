# frozen_string_literal: true

class NotificationService
  require 'fcm'

  def self.send_notification_to_employees(tokens, title, body)
    fcm = FCM.new('AAAABimuxL4:APA91bFF8l_aNhdbAdyHngO02NVnvgecUzvjE7Isnrf-jgthjLv-oXquK8PYOLz21OtRqneQKfPH9XdR8jSb6AcNB8DDbrta3LgYOddfbVH1YAlOGngN5DSDMQAilK935GvNNlnlBJXA')
    options = { notification: { title: title, body: body } }
    tokens.each do |device_token|
      fcm.send([device_token], options)
    end
  end
end
