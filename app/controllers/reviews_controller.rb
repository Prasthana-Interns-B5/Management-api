class ReviewsController < ApplicationController

  before_action :find_params, only: [:update,:destroy]

  def index
    reviews = Review.all
    render json: reviews, status: 200
  end

  def create
    review = Review.create(review_params)
    if review.save
      render json: review, status:200
    else
      render json: {message: "Review Cannot be created", error: review.errors.full_messages}
    end
  end

  def update
    if @review.update(review_params)
      render json: @review, status: 200
    else
      render json: {message: "Review Cannot be updated", error: @review.errors.full_messages}
    end
  end

  def destroy
    @review.destroy
    render json: {message: "Record Destroyed Successfully"}
  end

  def find_by_type
    reviews = Review.where("review_type=?",params[:review_type])
    render json: reviews
  end

  def comments
    review = Review.find(params[:id])
    comments = review.comments
    render json: comments
  end

    private
  def review_params
    params.require(:review).permit(:one_on_one_id, :review_type, :manager_review, :flag)
  end

  def find_params
    @review = Review.find(params[:id])
  end
end
