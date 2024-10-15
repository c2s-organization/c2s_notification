class NotificationsController < ApplicationController
  # POST /notifications
  def create
    notification = Notification.new(notification_params)
    notification.received_at = Time.current

    if notification.save
      render json: { message: 'Notificação recebida com sucesso.' }, status: :created
    else
      render json: { errors: notification.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def notification_params
    params.require(:notification).permit(:title, :body)
  end
end
