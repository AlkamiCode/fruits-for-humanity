class CartItemsController < ApplicationController
  include ActionView::Helpers::TextHelper
  # skip_before_action :verify_authenticity_token

  def create
    item           = Item.find(params[:item_id])
    item_quantity  = params[:quantity]
    @cart.add_item(item.id, item_quantity)
    session[:cart] = @cart.contents
    flash[:notice] = "You now have #{pluralize(@cart.count_of(item.id), item.title)}."
    redirect_to :back
  end

  def index
    if @cart.contents.empty?
      flash[:notice] = "Must Add Item(s) To View Cart Page"
      redirect_to root_path
    else
      @cart_items  = @cart.items
      @total_price = @cart.total_items_price(@cart_items)
    end
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