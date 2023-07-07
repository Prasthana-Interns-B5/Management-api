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

  def create
    employee = Employee.create(employee_params)
    #authorize employee
    if employee.save
      render json: employee, status: 200
    else
      render json: {message: "Employee Cannot be created", error: employee.errors.full_messages}
    end
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
    employee = Employee.find(params[:id])
    render json: employee.roles.distinct, status: 200
    #authorize manager
  end

  def assigned_members
    employee = Employee.find(params[:id])
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
    employee = Employee.find(params[:id])
    managers = employee.employee_roles.where(role_name:"manager")
    render json: managers, status: 200
  end  
  
  def assigned_teamlead
    employee = Employee.find(params[:id])
    teamleads = employee.employee_roles.where(role_name:"teamlead")
    render json: teamleads, status: 200
  end  

  def assigned_subordinate
    employee = Employee.find(params[:id])
    subordinates = employee.employee_roles.where(role_name:"subordinate")
    render json: subordinates, status: 200
  end  

  def queries
    employee = Employee.find(params[:id])
    queries = employee.questions
    #authorize employee
    render json: queries, status: 200
  end

  def scores
    employee = Employee.find(params[:id])
    scores = employee.points
    #authorize employee
    render json: scores, status: 200
  end

  def reviews
    employee=Employee.find(params[:id])
    feedback=employee.feedbacks
    #authorize employee ,:show?
    render json: feedback ,status:200
  end


  private

  def employee_params
    params.require(:employee).permit(:email,:password,:name)
  end


end
