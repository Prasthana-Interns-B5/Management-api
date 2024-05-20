# frozen_string_literal: true

class EmployeePointsController < ApplicationController
  before_action :authenticate_employee!

  def index
    points = EmployeePoint.all
    authorize points
    render json: points, status: :ok
  end

  def show
    point = EmployeePoint.find(params[:id])
    authorize point
    render json: point, status: :ok
  end

  def create
    point = EmployeePoint.new(point_params)
    # authorize point
    if point.save
      render json: point, status: :ok
    else
      render json: { message: 'Points Cannot be created', error: point.errors.full_messages }
    end
  end

  def update
    point = EmployeePoint.find(params[:id])
    authorize point
    if point.update(point_params)
      render json: point, status: :ok
    else
      render json: { message: 'Points cannot be updated', error: point.errors.full_messages }
    end
  end

  def destroy
    point = EmployeePoint.find(params[:id])
    authorize point
    point.destroy
    render json: { message: 'Record Destroyed Successfully' }
  end

  def manager_score
    point = EmployeePoint.find(params[:id])
    authorize point
    if point.update(manager_score_params)
      render json: point, status: :ok
    else
      render json: { message: 'Points Cannot be created', error: point.errors.full_messages }
    end
  end

  private

  def point_params
    params.require(:employee_point).permit(:self_score, :month, :employee_id, :manager_id)
  end

  def manager_score_params
    params.require(:employee_point).permit(:manager_score, :manager_id)
  end
end
