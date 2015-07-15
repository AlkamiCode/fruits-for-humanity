class CartsController < ApplicationController
  def show
    if @cart.contents.empty?
      flash[:error] = "Must Add Item To View Cart Page"
      redirect_to :back
    else
      @items = {}
      @cart.contents.each do |item_id, quantity|
        @items[Item.find(item_id.to_i)] = quantity
      end
      @total_price = @cart.total_items_price(@items)
    end
  end

  def delete
    session[:cart].clear
    flash[:notice] = "Your Cart Is Empty, Go Fill It Up!"
    redirect_to root_path
  end

  def update
    initial_quantity = @cart.contents[params[:item_id]]
    new_quantity     = params[:quantity].to_i
    item_id          = params[:item_id]

    @cart.update_item_quantity(item_id, initial_quantity, new_quantity)

    redirect_to :back
  end
end