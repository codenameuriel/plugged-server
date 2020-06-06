class CategoriesController < ApplicationController
  def create
    category = Category.create(category_params)
  end

  private 

  def category_params
    parmas.require(:category).permit(:name)
  end
end
