class AnswersController < ApplicationController
  before_action :authenticate_employee!

  def index
    answers = Answer.all
    # authorize answers
    render json: answers, status: 200
  end


  def show
    answer = Answer.find(params[:id])
    # authorize answer
    render json: answer, status: 200
  end

  def create
    answer = Answer.new(answer_params)
    authorize answer
    if answer.save
      render json: answer, status: 200
    else
      render json: {message: "Answer Cannot be created", error: answer.errors.full_messages}
    end
  end

  def update
    answer = Answer.find(params[:id])
    authorize answer
    if answer.update(answer_params)
      render json: answer, status: 200
    else
      render json: {message: "Answer cannot be updated", error: answer.errors.full_messages}
    end
  end

  def destroy
    answer = Answer.find(params[:id])
    authorize answer
    answer.destroy
    render json: {message: "Record Destroyed Successfully"}
  end

  private

  def answer_params
    params.require(:answer).permit(:reply, :question_id, :employee_id)
  end

end
