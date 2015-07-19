module CategoriesHelper
  def category_params
    params.require(:category).permit(:name, :image)
  end
end