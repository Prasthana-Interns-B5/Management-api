class DeviceTokensController < ApplicationController
    before_action :authenticate_employee!
    def create
        device= DeviceToken.new(device_params)
        device.employee_id = current_employee.id
        if device.save
           render json: device, status: 200
        else
            render json: device.errors
        end
    end

    def index
        devices = DeviceToken.all
        render json: devices
    end

    def show
        device = DeviceToken.find(params[:id])
        render json: device
    end

    private
    def device_params
        params.require(:device_token).permit(:device_type, :token)
    end
end
  