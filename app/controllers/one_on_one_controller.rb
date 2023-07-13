class OneOnOneController < ApplicationController
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
        render json: meetings
    end

    def create
        meeting = OneOnOne.new(meeting_params)
        authorize meeting
        if meeting.save
            render json: meeting, status: 200
        else
            render json: {message: "Meeting Cannot be created", error: meeting.errors.full_messages}  
        end
    end

    def update
        authorize @meeting
        if @meeting.update(meeting_params)
            render json: @meeting, status: 200
        else
            render json: {message: "Meeting Cannot be updated", error: @meeting.errors.full_messages}  
        end
    end

    def destroy
        authorize @meeting
        @meeting.destroy
        render json: {message: "Meeting id deleted successfuly"} 
    end
    
    private

    def find_params
        @meeting = OneOnOne.find(params[:id])
    end
    def meeting_params
        params.require(:one_on_one).permit(:member_id,:date,:time,:repeat_monthly,:notes)
    end

end
