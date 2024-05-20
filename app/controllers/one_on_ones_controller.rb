class OneOnOnesController < ApplicationController
  before_action :set_one_on_one, only: %i[show update destroy]
  before_action :set_employee, only: %i[index]

  # employee/:id/one_on_ones
  def index
    one_on_ones = if current_user.manager?
                    @employee.team_one_on_ones
                  else
                    @employee.one_on_ones
                  end
    render json: one_on_ones, status: :ok
  end

  # def meetings
  #     employee = current_employee
  #     if employee.role == "ur_manager"
  #         meetings = OneOnOne.where("employee_id=?",employee.id)
  #     else
  #       meetings = OneOnOne.where("member_id=?",employee.id)
  #     end
  #     meetings = employee_details(meetings)
  #     render json: meetings
  # end

  # one_on_one
  def create
    meeting = @employee.team_one_on_ones.create(meeting_params)
    authorize meeting
    if meeting.save
      notifications(meeting)
      render json: meeting, status: :created
    else
      render json: { message: 'Meeting Cannot be created', error: meeting.errors.full_messages }
    end
  end

  # one_on_one/:id
  def update
    authorize @one_on_one
    if @one_on_one.update(meeting_params)
      notifications(@one_on_one)
      render json: @one_on_one, status: :ok
    else
      render json: { message: 'Meeting Cannot be updated', error: @one_on_one.errors.full_messages },
             status: :forbidden
    end
  end

  # one_on_one/:id
  def destroy
    authorize @one_on_one
    @one_on_one.destroy
    notifications(@one_on_one)
    render json: { message: 'Meeting id deleted successfuly' }, status: :no_content
  end

  def reviews
    one_on_one = OneOnOne.find(params[:id])
    reviews = one_on_one.reviews
    reviews = reviews.where(review_type: params[:review_type]) if params[:review_type].present?
    render json: reviews
  end

  def rating
    one_on_one = OneOnOne.find(params[:id])
    rating = one_on_one.rating
    render json: rating
  end

  private

  def one_on_one_params
    params.require(:one_on_one).permit(:team_member_id, :date, :time, :repeat_monthly, :notes, :rating,
                                       reviews_attributes: %i[one_on_one_id review_type manager_review flag])
  end

  # def notifications(meeting)
  #     id = meeting.member_id
  #     device_tokens = DeviceToken.where(employee_id: id).pluck(:token)
  #     NotificationService.new.send_notification(device_tokens, params[:title], params[:body])
  # end

  def set_employee
    @employee = Employee.find(params[:employee_id])
  end

  def set_one_on_one
    @one_on_one = OneOnOne.find(params[:id])
  end
end
