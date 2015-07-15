class OrdersController < ApplicationController
  def create
    user_id     = session[:user_id]
    total_price = params[:total_price].to_i
    cart_items  = session[:cart]

    order = Order.create(user_id: user_id, total_price: total_price)

    cart_items.each do |item_id, quantity|
      OrderItem.create(item_id: item_id, order_id: order.id, quantity: quantity)
    end

    redirect_to orders_path
    # session[:cart].destroy
  end

  def index
    @orders = Order.all.where(user_id: session[:user_id])
  end
end