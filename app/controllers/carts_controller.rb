class CartsController < ApplicationController
  def delete
    session[:cart].clear
    flash[:notice] = "Your Cart Is Empty, Go Fill It Up!"
    redirect_to root_path
  end
end