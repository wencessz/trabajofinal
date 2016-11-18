module CategoryHelper
  def categories_list
    @categories = Category.all
  end
end
