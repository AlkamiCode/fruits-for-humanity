class CartsController < ApplicationController
  def show
    @items = {}
    session[:cart].each do |item_id, quantity|
      @items[Item.find(item_id.to_i)] = quantity
    end
  end
end