module PushMessenger
    class Android
        def deliver(app, tokens, payload, expiry = 1.day.to_i)
            tokens = *tokens 
            n = Rpush::Gcm::Notification.new
            n.app = Rpush::Gcm::App.find_by_name(app)
            n.registration_ids = tokens
            n.expiry = expiry
            n.data = payload
            n.priority = 'high'
            # n.content_available = true
            n.save!
        end
    end

    class Ios
        def deliver(app, tokens, payload)
            tokens = *tokens
            n = Rpush::Gcm::Notification.new
            n.app = Rpush::Gcm::App.find_by_name(app)
            n.registration_ids = tokens
            n.data = payload
            n.notification = {title: payload[:title]}
            n.save!
            # device_tokens.each do |device_token|
            #     n = Rpush::Apnsp8::Notification.new
            #     n.app = Rpush::Apnsp8::App.find_by_name(app)
            #     n.device_token  = device_token
            #     n.alert = "Hey!"
            #     n.data = payload
            #     n.save!
            # end     
        end
    end
end