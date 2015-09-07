class NotificationsController < ApplicationController
  def create
    binding.pry
    NotificationsMailer.contact(params[:notification]).deliver_now
    flash[:notice] = "Thanks For Sending Us An Email!"
    redirect_to :back
  end

  private

  def email_params
    params.permit(:name, :email, :message)
  end
end
