class ApplicationController < ActionController::API
  include Pundit::Authorization
  before_action :doorkeeper_authorize!, except: %i[send_email_auth_code verify_email_auth_code]
  before_action :set_current_user
  rescue_from Pundit::NotAuthorizedError, with: :employee_not_authorized

  attr_reader :current_user

   private

  def set_current_user
    @current_user = User.find(doorkeeper_token.resource_owner_id) if doorkeeper_token
  end

  def employee_not_authorized
    render json: 'OOPS! You are not authorized to perform this action', status: 401
  end
 end
