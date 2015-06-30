class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def show
    category = Category.find(params[:id])
    @category_items = category.items
  end
end