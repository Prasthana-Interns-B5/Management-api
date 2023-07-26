class NotificationsController < ApplicationController
    def send_notification
        title = params[:title]
        body = params[:body]
        tokens = params[:tokens]

        if tokens.present?
        NotificationService.send_notification_to_employees(tokens, title, body)
        render json: { message: 'Notifications sent successfully.' }
        else
        render json: { error: 'No employees found for notifications.' }, status: :unprocessable_entity
        end
    end
end
