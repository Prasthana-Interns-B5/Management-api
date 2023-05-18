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
    # authorize point
    if point.update(point_params)
      render json: point, status: 200
    else
      render json: {message: "Points cannot be updated", error: point.errors.full_messages}
    end
  end

  def destroy
    point = POint.find(params[:id])
    # authorize point
    point.destroy
    render json: {message: "Record Destroyed Successfully"}
  end



  private

  def point_params
    params.require(:point).permit(:score, :month, :employee_id)
  end

end
