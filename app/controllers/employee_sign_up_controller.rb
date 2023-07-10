class EmployeeSignUpController < ApplicationController

  def create_first_employee
    if Employee.count==0
    employee = Employee.create(employee_params)
    if employee.save
      render json: {message: "Employee Signed Up Successfully",data: employee}, status: 201
    else
      render json: {message: "Employee Cannot be created", error: employee.errors.full_messages},status: 422
    end
    else
      render json: {message: "Employee Can be created by HR only"},status: 422
    end 
 end

 def generate_otp
    updated_password = SecureRandom.random_number(100000..999999).to_s
    employee = Employee.find_by(getting_params)
    employee.update!(password: updated_password)
    EmailMailer.otp_email(employee.email,updated_password).deliver_now
    render json: {message:'OTP generated and sent!'},status: 200
 end

private

def employee_params
    params.require(:employee).permit(:email,:password,:name,:role)
end

def getting_params
    params.require(:employee).permit(:email)
end
  
end