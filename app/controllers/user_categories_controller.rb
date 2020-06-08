class UserCategoriesController < ApplicationController
  def create
    # byebug
    user = User.find_by(id: params[:user_id])
    category = Category.find_by(name: params[:category_name])

    if user && category
      UserCategory.find_or_create_by(user_id: user.id, category_id: category.id)
      render json: user, include: [:categories]
    else
      render json: { message: 'Could not subscribe user to category'}
    end
  end

  def destroy
    # byebug
    user = User.find_by(id: params[:user_id])

    if user 
      params[:categories].each do |name|
        category = Category.find_by(name: name)
        if category
          UserCategory.find_by(user_id: user.id, category_id: category.id).destroy
        end
      end
    else
      render json: { message: 'Could not unsubscribe from categories'}
    end
    render json: user, include: [:categories]
  end

  private 

  def user_category_params
    parmas.require(:user_category).permit(:user_id, :category_id)
  end
end
