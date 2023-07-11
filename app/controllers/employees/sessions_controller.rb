# frozen_string_literal: true

class Employees::SessionsController < Devise::SessionsController
  respond_to :json


 def generate_otp
  updated_password = SecureRandom.random_number(100000..999999).to_s
  employee = Employee.find_by(getting_params)
  employee.update!(password: updated_password)
  EmailMailer.otp_email(employee.email,updated_password).deliver_now
  render json: {message:'OTP generated and sent!'},status: 200
end

  private

  def respond_with(resource, options={})
  render json: current_employee, status: :ok, serializer: EmployeeSignInSerializer   
  end

 def respond_to_on_destroy
  jwt_payload = JWT.decode(request.headers["Authorization"].split(" ")[1],
     Rails.application.credentials.fetch(:secret_key_base)).first
  current_employee = Employee.find(jwt_payload["sub"])
  if current_employee
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

 def getting_params
  params.require(:employee).permit(:email)
 end

end
