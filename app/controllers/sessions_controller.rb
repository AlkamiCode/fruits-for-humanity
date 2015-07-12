class SessionsController < ApplicationController
  def new
    if current_user
      flash[:error] = "You're Already Logged In"
      redirect_to root_path
    end
  end

  def create
    @user = User.find_by(username: params[:session][:username])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      flash[:notice] = "Welcome Back #{@user.username}!"
      redirect_to root_path
    else
      # either user does not exist or password is incorrect
    end
  end
end