class Admin::CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def show
    category = Category.find(params[:id])
    @category_items = category.items
  end

  def update
    category = Category.find(params[:id])

    if category.items.any? { |item| item.available? }
      category.items.each do |item|
        item.update!(available: false)
      end
      flash[:notice] = "You've successfully retired #{category.name}."
      redirect_to :back
    else
      category.items.each do |item|
        item.update!(available: true)
      end
      flash[:notice] = "You've successfully un-retired #{category.name}."
      redirect_to :back
    end
  end
end