class OneOnOnesController < ApplicationController
    before_action :find_params, only: [:update, :destroy]
    
    def index
        employees = Employee.name_search(params)
        render json: employees
    end
    
    def meetings
        employee = current_employee
        if employee.role == "ur_manager"
            meetings = OneOnOne.where("employee_id=?",employee.id)
        else
            meetings = OneOnOne.where("member_id=?",employee.id)  
        end
        meetings = employee_details(meetings)
        render json: meetings
    end

    def create
        meeting = OneOnOne.create(meeting_params)
        authorize meeting
        if meeting.save
            notification = notifications(meeting)         
            render json: meeting, status: 200
        else
            render json: {message: "Meeting Cannot be created", error: meeting.errors.full_messages}  
        end
    end

    def update
        authorize @meeting
        if @meeting.update(meeting_params)
            notification = notifications(@meeting)  
            render json: @meeting, status: 200
        else
            render json: {message: "Meeting Cannot be updated", error: @meeting.errors.full_messages}  
        end
    end

    def destroy
        authorize @meeting
        @meeting.destroy
        notification = notifications(@meeting)  
        render json: {message: "Meeting id deleted successfuly"} 
    end

    def reviews
        one_on_one = OneOnOne.find(params[:id])
        reviews = one_on_one.reviews
        if params[:review_type].present?
            reviews = reviews.where(review_type:params[:review_type])
            render json: reviews
        else
            render json: reviews
        end
    end

    def rating
        one_on_one = OneOnOne.find(params[:id])
        rating = one_on_one.rating
        render json: rating
    end

    
    private

    def find_params
        @meeting = OneOnOne.find(params[:id])
    end
    def meeting_params
        params.require(:one_on_one).permit(:member_id,:date,:time,:repeat_monthly,:notes, :rating, 
        reviews_attributes: [:one_on_one_id, :review_type, :manager_review, :flag])
    end

    def notifications(meeting)
        id = meeting.member_id
        device_tokens = DeviceToken.where(employee_id: id).pluck(:token)
        NotificationService.send_notification(device_tokens, params[:title], params[:body])
    end

    def employee_details(meetings)
        meetings.each do |meeting|
            employee = Employee.find(meeting.member_id) 
            meeting.employee_attributes = {
                name: employee.name,
                role: employee.role
            }
        end        
    end

end
