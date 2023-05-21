# frozen_string_literal: true

class Employees::RegistrationsController < Devise::RegistrationsController
  before_action :authenticate_employee!
  respond_to :json


  def create
    employee = Employee.new(employee_params)
    authorize employee
    if employee.save
      render json: {message: "Employee Signed Up Successfully",data: employee}, status: 200
    else
      render json: {message: "Employee Cannot be created", error: employee.errors.full_messages}
    end
  end

  def update
    employee = Employee.find(params[:id])
     authorize employee
    if employee.update(employee_params)
      render json: employee, status: 200
    else
      render json: {message: "Employee cannot be updated", error: employee.errors.full_messages}
    end
  end

  def destroy
    employee = Employee.find(params[:id])
    authorize employee
    employee.destroy
    render json: {message: "Record Destroyed Successfully"}
  end

   private

   def respond_with(resource, options={})
    authorize employee
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
    params.require(:employee).permit(:email,:password,:name,:role)
  end
end
