# frozen_string_literal: true

class Employees::RegistrationsController < Devise::RegistrationsController
  
  respond_to :json


  def create
    employee = Employee.new(employee_params)
    authorize employee
    if employee.save
      render json: {message: "Employee Signed Up Successfully",data: employee}, status: 201
      EmailMailer.signup_email(employee.email,employee.password).deliver_now
    else
      render json: {message: "Employee Cannot be created", error: employee.errors.full_messages}
    end
  end

  
  
  
   private

   def respond_with(resource, options={})
    if resource.persisted?
      render json: {
        status: { code: 200, message: "Signed up Successfully", data: resource }

      }, status: :ok
    else
      render json: {
         status: { message: "Employee could not be created", errors: resource.errors.full_messages}, status: :unprocessable_entity
      }
    end
   end

  def employee_params
    params.require(:employee).permit(:email,:password,:name,:role,:manager_name,:manager_id)
  end
 
end



