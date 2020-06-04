class UsersController < ApplicationController
  def login
    # byebug
    user = User.find_by(username: params[:username])
    if user 
      render json: user
    else
      render json: { message: 'No user found by provided username'}
    end
  end

  def create
    # byebug
    user = User.find_or_create_by(user_params)
    if user
      render json: user
    else
      render json: { message: 'Could not create user' }
    end
  end

  private

  def user_params
    params.require(:user).permit(:username)
  end
end
