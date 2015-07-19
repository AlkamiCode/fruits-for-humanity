module ItemsHelper
  def item_params
    params.require(:item).permit(:title, :description, :price, :image)
  end
end