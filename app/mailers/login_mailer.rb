class LoginMailer < ApplicationMailer
  def send_auth_code(email, auth_code)
    @user_email = email
    @subject = "Access Code for Your Feedback Login - #{auth_code}"
    mail(to: @user_email, subject: @subject)
  end
end
