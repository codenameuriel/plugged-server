class UsersController < ApplicationController
  def login
    # byebug
    user = User.find_by(username: params[:username])
    if user 
      render json: user, include: [:categories]
    else
      render json: { message: 'No user found by provided username'}
    end
  end

  def show
    user = User.find(params[:id])
    if user 
      render json: user, include: [:categories]
    else
      render json: { message: 'Could not find user' }
    end
  end

  def create
    # byebug
    user = User.find_or_create_by(user_params)
    if user
      params[:categories].each do |id|
        user_category = UserCategory.create(user_id: user.id, category_id: id.to_i )
      end
      render json: user,  include: [:categories]
    else
      render json: { message: 'Could not create user' }
    end
  end

  private

  def user_params
    params.require(:user).permit(:username)
  end
end
