class CartItemsController < ApplicationController
  include ActionView::Helpers::TextHelper

  def create
    item           = Item.find(params[:item_id])
    item_quantity  = params[:quantity]
    @cart.add_item(item.id, item_quantity)
    session[:cart] = @cart.contents
    flash[:notice] = "You now have #{pluralize(@cart.count_of(item.id), item.title)}."
    redirect_to :back
  end

  def index
    @cart_items  = @cart.items
    @total_price = @cart.total_items_price(@cart_items)
  end

  def update
    @cart.contents[params[:id]] = params[:quantity].to_i
    redirect_to :back
  end

  def destroy
    @cart.contents.delete(params[:id])
    redirect_to :back
  end
end