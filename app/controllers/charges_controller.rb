class ChargesController < ApplicationController
  def new
  end

  def create
    order  = Order.find(params[:order_id])
    amount = order.total_price

    customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :card  => params[:stripeToken]
    )

    if Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => amount.to_i,
      :description => 'Rails Stripe customer',
      :currency    => 'usd'
      )
      order.pay!
      flash[:notice] = "Thanks For The Payment!"
      redirect_to :back
    end

    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to :back
    end
end
