class NotificationsController < ApplicationController

  def index
    @notifications = Notification.all.order(created_at: :desc)

    render json: @notifications
  end

  def create
    notification = Notification.new(notification_params)
    notification.received_at = Time.current

    if notification.save
      render json: { message: 'Notification successfully received.' }, status: :created
    else
      render json: { errors: notification.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def notification_params
    params.require(:notification).permit(:title, :body)
  end
end
