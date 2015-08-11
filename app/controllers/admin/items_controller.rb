class Admin::ItemsController < Admin::BaseController

  def create
    new_category = params[:item][:new_category]

    if new_category.empty?
      item = Item.new(item_params)
      existing_category = Category.find(params[:item][:category])
      item.categories << existing_category
      item.save!
      flash[:notice] = "Nice! You've added #{item.title} to the #{existing_category.name} category."
      redirect_to :back
    else
      item = Item.new(item_params)
      category = item.categories.new(name: new_category, image: params[:item][:category_image])
      category.save!
      item.save!
      flash[:notice] = "Nice! You've created a #{category.name} category and added #{item.title} to its list."
      redirect_to :back
    end
  end

  def update
    item = Item.find(params[:id])
    item.update(item_params)

    if item.save
      flash[:notice] = "Item updated!"
      redirect_to :back
    else
      flash[:notice] = "Unable to update item"
      redirect_to :back
    end
  end

  private

  def item_params
    params.require(:item).permit(:title, :description, :price, :image, :available)
  end
end