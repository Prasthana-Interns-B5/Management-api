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
    render json: {message: "Record Destroyed Successfully"}
  end

  def subordinates
    manager = Employee.find(params[:id])
    authorize manager
    subordinates = manager.subordinates
    render json: subordinates, status: 200
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
    authorize employee
    render json: feedback ,status:200
  end

  def current_employee_info
    render json: current_employee
  end

  private

  def employee_params 
    params.require(:employee).permit(:email, :password, :name, :role, :reporting_manager_id, :employee_no, :mobile_number)
  end

end
