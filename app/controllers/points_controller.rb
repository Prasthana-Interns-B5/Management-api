class PointsController < ApplicationController
  before_action :authenticate_employee!

  def index
    points = Point.all
    authorize points
    render json: points, status: 200
  end

  def show
    point = Point.find(params[:id])
    authorize point
    render json: point, status: 200
  end

  def create
    point = Point.new(point_params)
    # authorize point
    if point.save
      render json: point, status: 200
    else
      render json: {message: "Points Cannot be created", error: point.errors.full_messages}
    end
  end

  def update
    point = Point.find(params[:id])
    authorize point
    if point.update(point_params)
      render json: point, status: 200
    else
      render json: {message: "Points cannot be updated", error: point.errors.full_messages}
    end
  end

  def destroy
    point = Point.find(params[:id])
    authorize point
    point.destroy
    render json: {message: "Record Destroyed Successfully"}
  end

  def manager_score
    point = Point.find(params[:id])
    authorize point
    if point.update(manager_score_params)
      render json: point, status: 200
    else
      render json: {message: "Points Cannot be created", error: point.errors.full_messages}
    end
  end




  private

  def point_params
    params.require(:point).permit(:self_score, :month, :employee_id, :manager_id)
  end

  def manager_score_params
    params.require(:point).permit(:manager_score, :manager_id)
  end


end
