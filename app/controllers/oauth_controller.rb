class OauthController < Doorkeeper::TokensController
  include ActionController::Cookies

  after_action :check_for_token, only: :create
  def revoke
    # The authorization server first validates the client credentials

    if doorkeeper_token&.accessible?
      doorkeeper_token.revoke
    elsif request.POST['token']
      # Doorkeeper does not use the token_type_hint logic described in the RFC 7009
      # due to the refresh token implementation that is a field in the access token model.
      # revoke_token(request.POST['token']) if request.POST['token']

      header_doorkeeper_token = Doorkeeper::AccessToken.where(token: request.POST['token'].to_s).first
      header_doorkeeper_token.revoke if header_doorkeeper_token&.accessible?
    end
    # The authorization server responds with HTTP status code 200 if the
    # token has been revoked successfully or if the client submitted an invalid token
    render json: {}, status: :ok
  end

  def add_token_cookies(authorize_response)
    return if authorize_response.blank?

    access_token_value = { value: authorize_response.token.token, httponly: true }
    access_token_value[:domain] = 'feedback.com' unless Rails.env.development? || Rails.env.test?

    cookie_prefix = Rails.env.tr('-', '_')
    cookies[(cookie_prefix + '_access_token').to_sym] = access_token_value
  end

  def add_token_headers(authorize_response)
    return if authorize_response.blank?

    response.set_header('X-Auth-Token', authorize_response.token.token)
  end

  def check_for_token
    return if authorize_response.blank? || (authorize_response.status != 'ok'.to_sym)

    token_id = authorize_response&.token&.id

    if params[:refresh_token]
      doorkeeper_token = Doorkeeper::AccessToken.find_by(refresh_token: params[:refresh_token])
      user_login = doorkeeper_token ? UserLogin.find_by(token_id: doorkeeper_token.id) : nil
    else
      user_id = authorize_response&.token&.resource_owner_id
      user_login = User.find_by(id: user_id)&.user_logins&.first
    end

    return unless token_id && user_login && user_login.user

    add_token_cookies(authorize_response)
    add_token_headers(authorize_response)

    if params[:refresh_token]
      user_login.update(token_id: token_id, login_token: nil)
    else
      user_login.update(token_id: token_id, last_logged_in: Time.zone.now, login_token: nil)
      user_login.user.update(last_sign_in_at: user_login.last_logged_in)
    end
  end
end
