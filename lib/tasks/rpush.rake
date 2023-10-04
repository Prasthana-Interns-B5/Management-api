
namespace :rpush do
    desc "Create Rpush android app"
    task android_app: [:environment] do
      Rpush::Gcm::App.create(name: "android_app", connections: 1, environment: Rails.env, type: "Rpush::Client::ActiveRecord::Gcm::App", auth_key: "AAAAS-2x-5o:APA91bGdB5w8exN_zhJOb4RF1gb7pT-aJeJBw7pkMLfUPIGvvBi8FRq5ABbwyJIm1gxi24bZyyvelBPOYxnLe7gf9CA63U-aTLzqni5ycxIZzPBUn4vOMXX97_2tdgoryjxyU0wIasS3")
      puts "Rpush Android app created Successfully"
    end
  
    desc "Create Rpush Ios app"
    task ios_app: [:environment] do
      Rpush::Gcm::App.create(name: "ios_app", connections: 1, environment: Rails.env, type: "Rpush::Client::ActiveRecord::Gcm::App", auth_key: "AAAAS-2x-5o:APA91bGdB5w8exN_zhJOb4RF1gb7pT-aJeJBw7pkMLfUPIGvvBi8FRq5ABbwyJIm1gxi24bZyyvelBPOYxnLe7gf9CA63U-aTLzqni5ycxIZzPBUn4vOMXX97_2tdgoryjxyU0wIasS3", certificate: File.read('config/file_name.p8'))
      # Rpush::Apnsp8::App.create(name: "ios_app", connections: 1, environment: Rails.env, type: "Rpush::Client::ActiveRecord::Apnsp8::App",apn_key: File.read("path/to/p8"), apn_key_id: '', bundle_id: '', team_id: '')
      puts "Rpush IOS app created Successfully"
    end
end