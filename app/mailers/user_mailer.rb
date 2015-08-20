class UserMailer < ApplicationMailer
  default from: "whatver@gmail.com"

  def welcome_email(user)
    @user = user
    mail(to: @user.email_address, subject: "Fruits For Humanity Registration")
  end
end
