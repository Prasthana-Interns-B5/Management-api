class ApplicationController < ActionController::API
  include Pundit
  alias_method :current_user, :current_employee

  rescue_from Pundit::NotAuthorizedError, with: :employee_not_authorized

  private

  def employee_not_authorized
    #flash[:alert] = "You are not authorized to perform this action."
    #redirect_back(fallback_location: root_path)
    render json: "You are not authorized to perform this action"
  end
end
