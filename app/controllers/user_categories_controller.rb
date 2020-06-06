class UserCategoriesController < ApplicationController
  def create
    user_category = UserCategory.create(user_category_params)
  end

  private 

  def user_category_params
    parmas.require(:user_category).permit(:user_id, :category_id)
  end
end
