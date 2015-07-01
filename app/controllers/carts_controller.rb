class CartsController < ApplicationController
  def show
    @items = {}
    session[:cart].each do |item_id, quantity|
      @items[Item.find(item_id.to_i)] = quantity
    end
  end

  def delete
    session[:cart].clear
    redirect_to :back
  end
end