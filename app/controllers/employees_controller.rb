class EmployeesController < ApplicationController
  before_action :set_employee, except: %i[index create]

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
    head :no_content
  end

  private

  def set_employee
    @employee = Employee.find(params[:id])
  end

  def employee_params
    permitted_attributes(Employee)
  end
end
