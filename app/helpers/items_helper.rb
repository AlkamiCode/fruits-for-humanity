module ItemsHelper
  def article_params
    params.require(:item).permit(:title, :description, :price, :image)
  end
end