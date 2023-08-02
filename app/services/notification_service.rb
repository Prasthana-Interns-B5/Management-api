class NotificationService
    require 'fcm'
  
    def self.send_notification(tokens, title, body)
        fcm = FCM.new(FCM_SERVER_KEY) 
        options = { notification: { title: title, body: body } }
        tokens.each do |device_token|
            response = fcm.send([device_token], options)
        end    
    end
end