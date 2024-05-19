class LoginMailer < ApplicationMailer
  def send_auth_code(email, auth_code, id)
    @user_email = email
    @auth_code = auth_code
    @subject = 'Access Code for Your Feedback Login'
  end
end
