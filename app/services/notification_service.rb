class NotificationService
    require 'fcm'
  
    def send_notification(device_tokens, title, body)
        fcm = FCM.new(FCM_SERVER_KEY) 
        options = { notification: { title: title, body: body } }
        device_tokens.each do |device_token|
            response = fcm.send([device_token], options)
        end
    end
end