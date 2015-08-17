class User::OrdersController < User::BaseController
  def create
    user_id     = session[:user_id]
    total_price = params[:total_price].to_f
    cart_items  = session[:cart]

    order = Order.create(user_id: user_id, total_price: total_price)

    cart_items.each do |item_id, quantity|
      OrderItem.create(item_id: item_id, order_id: order.id, quantity: quantity)
    end

    session[:cart] = {}
    redirect_to new_charge_path(total_price: order.total_price)
  end

  def index
    @orders = Order.all.where(user_id: session[:user_id])
  end
end