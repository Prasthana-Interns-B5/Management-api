class EmployeesController < ApplicationController
  before_action :set_employee, except: %i[index create current_employee_info subordinates all_employees]

  def index
    employee = Employee.filter(current_user, params)
    render json: employee, status: :ok
  end

  def show
    authorize @employee
    render json: @employee, status: :ok
  end

  def update
    authorize @employee
    @employee.update!(employee_params)
    render json: @employee, status: :ok
  end

  def create
    authorize Employee
    @employee = Employee.create!(employee_params)
    render json: @employee, status: :created
  end

  def destroy
    authorize @employee
    @employee.destroy!
    render json: { message: 'Record Destroyed Successfully' }
  end

  def subordinates
    employee = current_employee
    return unless (employee.role = 'ur_manager')

    subordinates = Employee.where(reporting_manager_id: employee.id)
    render json: subordinates, status: 200
  end

  def all_employees
    employees = Employee.all
    render json: employees, status: 200
  end

  def queries
    queries = @employee.questions
    render json: queries, status: 200
  end

  def scores
    scores = @employee.points
    render json: scores, status: 200
  end

  def reviews
    feedback = @employee.feedbacks
    render json: feedback, status: 200
  end

  def current_employee_info
    render json: {}
  end

  private

  def authorize_employee
    flast[:alert] = 'You are not authorized to perform this action' unless authorize @employee
  end

  def set_employee
    @employee = Employee.find(params[:id])
  end

  def employee_params
    permitted_attributes(Employee)
  end
end
