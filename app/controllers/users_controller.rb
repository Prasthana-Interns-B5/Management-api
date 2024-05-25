class UsersController < ApplicationController
  include CurrentSessionConcern
  before_action :set_user, :set_user_login
  def send_email_auth_code
    if @user
      user_login = @user.user_logins.create!(user_login_params)
      render json: user_login, serializer: UserLoginSimpleSerializer, status: :ok
    else
      render json: 'User Not Present', status: :unprocessable_entity
    end
  end

  def verify_email_auth_code
    render(json: { error: 'Login record not found', error_code: 'login_record_not_found' }, status: :not_found) && return unless @user_login

    if @user_login.validate_email_auth_code(params[:email_auth_code])
      @user_login.process_email_access_code_verified
      render json: @user_login
    else
      render json: 'Invalid otp', status: :unprocessable_entity
    end
  end

  def prepare
    render json: current_user, serializer: CurrentUserPermissionSerializer, status: :ok
  end

  private

  def set_user
    return unless params[:email]

    @user = User.find_by(email: params[:email].to_s.strip.downcase)
  end

  def set_user_login
    @user_login = UserLogin.find_by(id: params[:id])
  end

  def user_login_params
    allowed_params = params.permit(:email, :device_name, :device_type, :mobile_type, :device_uid)
    requester_ip = request.headers[:HTTP_X_REAL_IP] || request.ip
    allowed_params.merge(requester_ip: requester_ip)
  end
end
