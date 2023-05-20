class AnswersController < ApplicationController
  before_action :authenticate_employee!

  def index
    answers = Answer.all

    # authorize employee
    render json: answers, status: 200
  end


  def show
    answer = Answer.find(params[:id])
    employee = answer.employee
    authorize employee
    render json: answer, status: 200
  end

  def create
    answer = Answer.new(answer_params)
    employee = answer.employee
    authorize employee
    if answer.save
      render json: answer, status: 200
    else
      render json: {message: "Answer Cannot be created", error: answer.errors.full_messages}
    end
  end

  def update
    answer = Answer.find(params[:id])
    employee = answer.employee
    authorize employee
    if answer.update(answer_params)
      render json: answer, status: 200
    else
      render json: {message: "Answer cannot be updated", error: answer.errors.full_messages}
    end
  end

  def destroy
    answer = Answer.find(params[:id])
    employee = answer.employee
    authorize employee
    answer.destroy
    render json: {message: "Record Destroyed Successfully"}
  end

  private

  def answer_params
    params.require(:answer).permit(:answer, :employee_id)
  end

end
