class Admin::ItemsController < Admin::BaseController

  def create
    item_title       = params[:item][:title]
    item_description = params[:item][:description]
    item_price       = params[:item][:price].to_f
    item_image       = params[:item][:image]
    category         = params[:item][:category]
    new_category     = params[:item][:new_category]
    category_image   = params[:item][:category_image]

    if new_category.empty?
      item = Item.new(title: item_title, description: item_description, price: item_price, image: item_image)
      existing_category = Category.find(category)
      item.categories << existing_category
      item.save!
      flash[:notice] = "Nice! You've added #{item.title} to the #{existing_category.name} category."
      redirect_to :back
    else
      item = Item.new(title: item_title, description: item_description, price: item_price, image: item_image)
      category = item.categories.new(name: new_category, image: category_image)
      category.save!
      item.save!
      flash[:notice] = "Nice! You've created a #{category.name} category and added #{item.title} to its list."
      redirect_to :back
    end
  end

  def item_status
    item = Item.find(params[:id])
    if item.available?
      item.update!(available: false)
      flash[:notice] = "You've successfully retired #{item.title}."
      redirect_to :back
    else
      item.update!(available: true)
      flash[:notice] = "You've successfully un-retired #{item.title}."
      redirect_to :back
    end
  end
end