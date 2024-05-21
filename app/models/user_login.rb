class UserLogin < ApplicationRecord
  validates :email, :device_name, :device_type, :mobile_type, :device_uid, presence: true
  before_validation :generate_auth_token, on: :create
  belongs_to :user
  after_create :send_otp_to_user

  default_scope { order('id DESC') }

  def send_otp_to_user
    return if email.blank?

    mailer = LoginMailer.send_auth_code(user.email, email_auth_code)
    mailer.deliver_later
    mark_as_email_auth_code_sent
  end

  def mark_as_email_auth_code_sent
    update(email_auth_code_sent_at: Time.zone.now)
  end

  def generate_auth_token
    auth_code = if Rails.env.development?
                  123_456
                else
                  rand(111_111..999_999)
                end
    self.email_auth_code = auth_code
  end

  def validate_email_auth_code(code)
    return false if email_auth_code_verified_at || user.blank?

    email_auth_code == code
  end

  def process_email_access_code_verified
    set_login_token
    update(email_auth_code_verified_at: Time.zone.now)
  end

  def set_login_token
    token = nil
    loop do
      token = Devise.friendly_token(100)
      break if UserLogin.where(login_token: token).count.zero?
    end

    update(login_token: token)
  end
end
