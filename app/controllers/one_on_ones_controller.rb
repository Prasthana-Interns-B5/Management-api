class OneOnOnesController < ApplicationController
  before_action :set_one_on_one, only: %i[show update destroy]
  before_action :set_employee, except: %i[create]

  def index
    authorize @employee
    render json: @employee.one_on_ones, each_serializer: OneOnOneSerializer, status: :ok
  end

  def show
    authorize @one_on_one
    render json: @one_on_one, status: :ok
  end

  def create
    authorize OneOnOne
    @one_on_one = OneOnOne.create!(one_on_one_params)
    render json: @one_on_one, status: :created
  end

  # one_on_one/:id
  def update
    authorize @one_on_one
    @one_on_one.update(one_on_one_params)
    render json: @one_on_one, status: :ok
  end

  # one_on_one/:id
  def destroy
    authorize @one_on_one
    @one_on_one.destroy!
    head :no_content
  end

  private

  def one_on_one_params
    permitted_attributes(OneOnOne).merge!(employee_id: current_user.employee_id)
  end

  def set_employee
    @employee = if params[:employee_id]
                  Employee.find(params[:employee_id])
                else
                  current_user.employee
                end

  end

  def set_one_on_one
    @one_on_one = OneOnOne.find(params[:id])
  end
end
