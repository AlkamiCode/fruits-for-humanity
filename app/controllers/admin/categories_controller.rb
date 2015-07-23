class Admin::CategoriesController < ApplicationController

  def show
    category = Category.find(params[:id])
    @category_items = category.items
  end
end