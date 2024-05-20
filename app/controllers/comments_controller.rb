# frozen_string_literal: true

class CommentsController < ApplicationController
  def index
    comments = Comment.all
    render json: comments
  end

  def create
    comment = Comment.create(comment_params)
    comment.employee_id = current_employee.id
    if comment.save
      render json: comment, status: 200
    else
      render json: { message: 'Comment Cannot be created', error: comment.errors.full_messages }
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
    render json: { message: 'Comment deleted successfuly' }
  end

  private

  def comment_params
    params.require(:comment).permit(:employee_id, :review_id, :comment)
  end
end
