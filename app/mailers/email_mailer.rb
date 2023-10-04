class EmailMailer < ApplicationMailer


    def signup_email(email)
        mail to: email,
        from: "apimanagement23@gmail.com",
        subject: 'Signup mail',
        body: email
    end


    def otp_email(email,otp)
      mail to: email,
      from: "apimanagement23@gmail.com",
      subject: 'OTP FOR LOGIN',
      body: otp
    end

    def one_on_one_email(email, title, description)
      mail to:email, 
      from: "apimanagement23@gmail.com",
      subject: "One On One Meeting",
      body: "title: #{title},  
      description: #{description}"
    end

    
         
end
