class FeedbacksController < ApplicationController
    before_action :find_feedback, only: %i[show update destroy get_individual_feedback ]
    def index
        feedback =Feedback.all
        render json: feedback,status: 200
    end

    def create
        feedback=Feedback.new(feedback_params)
        if feedback.save 
            render json: {message:"feedback created successfully",data:feedback},status: 201
        else
            render json: {message:"feedback cannot be created",errors:feedback.errors.full_messages},status: 422
        end
    end

    def show
        render json: @feedback,status: 200
    end

    def update
        if @feedback.update(feedback_params)
            render json:{message:"feedback updated successfully",data:@feedback}
        else
            render json:{message:"feedback cannot be updated",errors:@feedback.erors.full_messages}
        end
    end

    def destroy
        if @feedback.destroy
            render json:{message:"feedback deleted successfully",data:@feedback}
        else
            render json:{message:"feedback cannot be deleted",errors:@feedback.erors.full_messages}
        end
    end

    def get_individual_feedback
        feedback=Feedback.where(employee_id:params[:id])
        #.where(feedback_type:params[:feedback_type])
        render json: feedback,status: 200
    end

    def get_individual_feedback_type
        feedback=Feedback.where(feedback_type:params[:feedback_type])
        render json: feedback,status:200
    end

    private

    def feedback_params
        params.require(:feedback).permit(:employee_feedback,:feedback_type)
    end

    def find_feedback
        @feedback=Feedback.find(params[:id])
    end
end
