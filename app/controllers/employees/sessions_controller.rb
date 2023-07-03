# frozen_string_literal: true

class Employees::SessionsController < Devise::SessionsController
  respond_to :json

  private

  def respond_with(resource, options={})
  render json: current_employee, status: :ok, serializer: EmployeeSignInSerializer 

    
    EmailMailer.log_in_email(current_employee.email).deliver_later
  end

 def respond_to_on_destroy
  jwt_payload = JWT.decode(request.headers["Authorization"].split(" ")[1],
     Rails.application.credentials.fetch(:secret_key_base)).first
  current_employee = Employee.find(jwt_payload["sub"])
  if current_employee
    EmailMailer.logout(current_employee.email).deliver_later
    render json: {
      status: 200,
      message: "Signed out Successfully",
      data: current_employee
    }, status: :ok
  else
    render json: {
      status: 401,
      message: "Employee has no active session"
    }, status: :unauthorized
  end
 end

end
