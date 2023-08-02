class DeviceTokensController < ApplicationController

    before_action :find_params, only: [:update, :show, :destroy]
    
    def index
        render json: DeviceToken.all
    end

    def create
        device_token = current_employee.device_tokens.new(token: params[:token])
        if device_token.save
            render json: { message: 'Device token saved successfully.' }
        else
            render json: { message: 'Device token can not be saved.', error: device_token.errors.full_messages }
        end 
    end
    
    def show
        render json: @device_token
    end

    def update
        if @device_token.update(token: params[:token])
            render json: { message: 'Device token updated successfully.' }
        else
            render json: { message: 'Device token can not be updated.', error: @device_token.errors.full_messages }  
        end
    end

    def destroy
        @device_token.destroy
        render json: { message: 'Record destroyed successfully.' }
    end

    def all_tokens
        render json: current_employee.device_tokens
    end

    private
    def find_params
        @device_token = DeviceToken.find(params[:id])
    end
end
