class EmployeesController < ApplicationController
  #before_action :authenticate_employee!

  def index
    employees = Employee.all
    render json: employees, status: 200
  end

  def show
    employee = Employee.find(params[:id])
    #authorize employee
    render json: employee, status: 200
  end

  def update
    employee = Employee.find(params[:id])
    #authorize employee
    if employee.update(employee_params)
      render json: employee, status: 200
    else
      render json: {message: "Employee cannot be updated", error: employee.errors.full_messages}
    end
  end

  def destroy
    employee = Employee.find(params[:id])
    #authorize employee
    employee.destroy
    render json: {message: "Record Destroyed Successfully"}
  end

  def roles
    employee = current_employee
    render json: employee.roles.distinct, status: 200
  end

  def assigned_members
    employee = current_employee
    if employee.roles.pluck(:role_name).include?("manager")
      members = employee.employee_roles.where(role_name:"teamlead").or(employee.employee_roles.where(role_name:"subordinate"))
      render json: members, status: 200
    elsif employee.roles.pluck(:role_name).include?("teamlead")
      members = employee.employee_roles.where(role_name:"subordinate")  
      render json: members, status: 200
    else  
      render json: {message: "No employees present for one_on_one", error: employee.errors.full_messages}
    end  
  end

  def assigned_manager
    employee = current_employee
    managers = employee.employee_roles.where(role_name:"manager")
    render json: managers, status: 200
  end  
  
  def assigned_teamlead
    employee = current_employee
    teamleads = employee.employee_roles.where(role_name:"teamlead")
    render json: teamleads, status: 200
  end  

  def assigned_subordinate
    employee = current_employee
    subordinates = employee.employee_roles.where(role_name:"subordinate")
    render json: subordinates, status: 200
  end  

  def queries
    employee = Employee.find(params[:id])
    queries = employee.questions
    render json: queries, status: 200
  end

  def scores
    employee = Employee.find(params[:id])
    scores = employee.points
    render json: scores, status: 200
  end

  def reviews
    employee=Employee.find(params[:id])
    feedback=employee.feedbacks
    #authorize employee ,:show?
    render json: feedback ,status:200
  end

  def current_employee_info
    render json: current_employee
  end

  private

  def employee_params
    params.permit(:email,:password,:name)
  end

end
