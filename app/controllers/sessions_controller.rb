class SessionsController < ApplicationController

  def create
    @user = User.find_by(username: params[:session][:username])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      flash[:notice] = "Welcome Back #{@user.username}!"
        if current_admin?
          redirect_to admin_categories_path
        else
          redirect_to :back
        end
    else
      flash[:error] = "Incorrect Login, Pleas Try Again"
      redirect_to :back
    end
  end

  def destroy
    session.destroy
    current_user = nil
    flash[:notice] = "You've Logged Out"
    redirect_to root_path
  end
end