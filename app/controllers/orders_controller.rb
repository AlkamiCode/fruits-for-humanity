class OrdersController < ApplicationController
  def create
    @order = Order.new
  end

  def index
    @orders = Order.all
  end
end