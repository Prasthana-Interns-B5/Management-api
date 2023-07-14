class RatingsController < ApplicationController

    before_action :find_params, only: [:update,:destroy]

    def index
        ratings = Rating.all
        render json: ratings, status: 200
    end

    def create
        rating = Rating.create(rating_params)
        if rating.save
            render json: rating, status:200
        else
            render json: {message: "Rating Cannot be created", error: rating.errors.full_messages}
        end
    end

    def update
        if @rating.update(rating_params)
            render json: @rating, status: 200
        else
            render json: {message: "Rating Cannot be updated", error: @rating.errors.full_messages}
        end
    end

    def destroy
        @rating.destroy
        render json: {message: "Record Destroyed Successfully"}
    end

    private
    def rating_params
        params.require(:rating).permit(:one_on_one_id, :manager_rating)
    end

    def find_params
        @rating = Rating.find(params[:id])
    end

end