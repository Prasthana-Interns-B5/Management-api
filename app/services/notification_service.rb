class NotificationService
  
    def self.send_notification_to_employees(member_id, title, description)
        payload = {title: title, description: description}
        android_condition = "device_type = 'android' and employee_id = #{member_id.to_i}"
        ios_condition = "device_type = 'ios' and employee_id = #{member_id.to_i}"
        get_tokens(payload, android_condition, 'android')
        get_tokens(payload, ios_condition, 'ios')
    end
    
    def self.get_tokens(payload, condition, device_type)
        tokens = DeviceToken.where(condition).pluck(:token).compact
        puts "tokens plucked"
        if tokens.present?
          puts "tokens"
          send_notification(tokens, payload, device_type)          
        end
    end
      
    def self.send_notification(tokens, payload, device_type= 'android')
        messenger = (device_type == 'android' ? PushMessenger::Android.new : PushMessenger::Ios.new)
        begin
          messenger.deliver("#{device_type}_app", tokens, payload)
          puts "push notification delivered"
        rescue Exception => error
          Rails.logger.debug error
        end
    end
end