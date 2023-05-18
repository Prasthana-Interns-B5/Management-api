class FeedbacksController < ApplicationController
    before_action :authenticate_employee!
    # before_action :set_id ,on: [:show,:destroy]

    def index
      feedback = Feedback.all
       authorize feedback
      render json: feedback, status: 200
    end

    def show
      feedback=Feedback.find(params[:id])
      authorize feedback
      render json: feedback ,status:200
    end

     

    def create
      feedback=Feedback.new(fed_params)
      if feedback.save
        render json: feedback ,status: 200
      else
        render json: {message: "Feedback Cannot be created", error: feedback.errors.full_messages}
      end
    end

    def comments
      feedback=Feedback.find(params[:id])
        authorize feedback
      if feedback.subordinate_id.present?
        feedback.update(com_params)
        render json: feedback ,status: 200
      else
        render json: {message: "Your not allowed to comment"}
      end
      
    end



    

    def update
      feedback=Feedback.find(params[:id])
      if feedback.update(fed_params)
        render json: feedback, status: 200
    else
      render json: {message: "Feedback cannot be updated", error: feedback.errors.full_messages}
      end
    end

    def destroy
      feedback=Feedback.find(params[:id])
          
       authorize feedback
        if feedback.destroy
            render json:  {message: "Record Destroyed Successfully"}
        else
            render json:  {error: "SOmething went wrong"}
        end

    end

  private

 
  def fed_params
    params.require(:feedback).permit(:review,:month,:employee_id,:subordinate_id,:before,:comments)
  end
 def com_params
  params.require(:feedback).permit(:comments)
 end

  # def set_id
  #   @fed=Feedback.find(params[:id])
  # end
end
