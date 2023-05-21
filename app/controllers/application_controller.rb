class ApplicationController < ActionController::API
  include Pundit::Authorization
  alias_method :current_user, :current_employee

  before_action :set_current_employee





  rescue_from Pundit::NotAuthorizedError, with: :employee_not_authorized
  # rescue_from NoMethodError, with: :employee_not_HR

  private

  def set_current_employee
    Current.employee = current_employee
  end

  def employee_not_authorized
    #flash[:alert] = "You are not authorized to perform this action."
    #redirect_back(fallback_location: root_path)
    render json: "OOPS! You are not authorized to perform this action"
  end

 def employee_not_HR
  render json: "Only HR is permitted to do this action!"
 end
end
