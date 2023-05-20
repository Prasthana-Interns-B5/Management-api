class QuestionsController < ApplicationController
  before_action :authenticate_employee!

  def index
    questions = Question.where(anonymous: true)
    # authorize questions
    render json: questions, status: 200
  end

  def show
    question = Question.find(params[:id])
    # authorize question
    render json: question, status: 200
  end

  def create
    question = Question.new(question_params)
    # authorize question
    if question.save
      render json: question, status: 200
    else
      render json: {message: "Question Cannot be created", error: question.errors.full_messages}
    end
  end

  def update
    question = Question.find(params[:id])
    # authorize question
    if question.update(question_params)
      render json: question, status: 200
    else
      render json: {message: "Question cannot be updated", error: question.errors.full_messages}
    end
  end

  def destroy
    question = Question.find(params[:id])
    # authorize question
    question.destroy
    render json: {message: "Record Destroyed Successfully"}
  end

  def replies
    question = Question.find(params[:id])
    replies = question.answers
    render json: replies, status: 200

  end

  private

  def question_params
    params.require(:question).permit(:query, :employee_id, :clarified, :remarks, :manager_id)
  end


end
