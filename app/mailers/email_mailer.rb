class EmailMailer < ApplicationMailer


    def signup_email(email,code)
        mail to: email,
        from: "apimanagement23@gmail.com",
        subject: 'Login mail',
        body: email
    end


  def otp_email(email,otp)
    mail to: email,
    from: "apimanagement23@gmail.com",
    subject: 'OTP FOR LOGIN',
    body: otp
  end
         
end
