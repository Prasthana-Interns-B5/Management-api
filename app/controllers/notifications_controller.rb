class NotificationsController < ApplicationController

  before_action :authenticate_employee!
    def send_notification
        title = params[:title]
        body = params[:body]
        id = params[:id] 
        if current_employee.role == 'ur_manager' && id.present?
           NotificationService.send_notification_to_employees(id, title, body)
           render json: { message: 'Notifications sent successfully.'}
        else
          render json: { error: 'No employees found for notifications.' }, status: :unprocessable_entity
        end
    end
end
