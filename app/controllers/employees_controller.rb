class EmployeesController < ApplicationController
before_action :authenticate_employee!
  
  def index
    employees = Employee.all
    authorize employees
    render json: employees, status: 200
  end

  def show
    employee = Employee.find(params[:id])
   authorize employee
    render json: employee, status: 200
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
    render json: {message: "Record Destroyed Successfully"},status: 204
  end

 
  def queries
    employee = Employee.find(params[:id])
    queries = employee.questions
    authorize employee
    render json: queries, status: 200
  end

  def scores
    employee = Employee.find(params[:id])
    scores = employee.points
    authorize employee
    render json: scores, status: 200
  end


  def reviews
    employee=Employee.find(params[:id])
    feedback=employee.feedbacks
     authorize employee ,:show?
    render json: feedback ,status:200
  end

private

  def employee_params
    params.permit(:email,:password,:name,:role,:manager_name,:manager_id)
  end
  def role_params
    params.require(:employee).permit(:role,:manager_id,:manager_name)
  end

end
