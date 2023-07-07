class OneOnOneController < ApplicationController
    def index
        search_query = params[:search].downcase
        employees = Employee.where("LOWER(name) LIKE :query ", query: "%#{search_query}%")
        render json: employees, status: 200
    end

    
    
    def create
        meeting = OneOnOne.create(meeting_params)
        if meeting.save
            render json: meeting, status: 200
        else
            render json: {message: "Meeting Cannot be created", error: meeting.errors.full_messages}  
        end
    end

    def update
        meeting = OneOnOne.find(params[:id])
        if meeting.update(meeting_params)
            render json: meeting, status: 200
        else
            render json: {message: "Meeting Cannot be updated", error: meeting.errors.full_messages}  
        end
    end


    private
    def meeting_params
        params.require(:one_on_one).permit(:team,:date,:time,:repeat_monthly,:notes)
    end

end
