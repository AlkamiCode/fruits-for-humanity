class UsersController < ApplicationController

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Welcome! #{@user.username}. Thanks For Registering."
      redirect_to root_path
    else
      flash[:error] = "Could not create user!"
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :email_address)
  end
end