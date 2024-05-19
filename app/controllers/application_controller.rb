class ApplicationController < ActionController::API
  include Pundit::Authorization
  before_action :set_current_user
  rescue_from Pundit::NotAuthorizedError, with: :employee_not_authorized

  def current_user
    @current_user
  end

  private

  def set_current_user
    @current_user = User.find(doorkeeper_token.resource_owner_id) if doorkeeper_token
  end

   def employee_not_authorized
    render json: "OOPS! You are not authorized to perform this action",status: 401
  end
 end
