class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def show
    category = Category.find(params[:id])
    @category_items = category.items

    if category.items.all? { |item| item.available? == false}
      flash[:error] = "This Category Is Empty, Nice Try!"
      redirect_to :root
    end
  end
end