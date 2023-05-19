class FeedbacksController < ApplicationController
    def index
        feedback=Feedback.all
        authorize feedback
        render json: feedbacks ,status: 200
    end

    def show
        feedback = Feedback.find(params[:id])
        authorize feedback
        render json: feedback, status: 200
    end

    def create
        feedback = Feedback.new(feedback_params)
        authorize feedback
        if feedback.save
          render json: feedback, status: 200
        else
          render json: {message: "Feedback Cannot be created", error: feedback.errors.full_messages}
        end
    end

    def update
        feedback = Feedback.find(params[:id])
        authorize feedback
        if feedback.update(feedback_params)
          render json: feedback, status: 200
        else
          render json: {message: "feedback cannot be updated", error: feedback.errors.full_messages}
        end
    end
     
    def destroy
        feedback=Feedback.find(params[:id])
        authorize feedback
        feedback.destroy
            render json: "Successfully deleted",status: 200
    
    end


    def manager_feedback
        feedback=Feedback.find(params[:id])
        authorize feedback
        if feedback.update(manager_feedback_params)
            render json: feedback ,status: 200
        else
            render json: "something went wrong" 
        end
    end


    def comments
        feedback=Feedback.find(params[:id])
        authorize feedback
        if feedback.manager_feedback.present?
            feedback.update(comment_param)
                render json: feedback ,status: 200
        else
            render json: "Your not allowed to commit  without manager's Feedback"
        end
    end






      private

      def feedback_params
        params.require(:feedback).permit(:self_feedback,:month,:before,:employee_id)
      end
    
      def manager_feedback_params
        params.require(:feedback).permit(:manager_feedback, :manager_id)
      end
      def comment_param
        params.require(:feedback).permit(:comments)
      end
end

