class UsersController < ApplicationController
  def create
    @user = User.new(user_params)
    if @user.save
      render json: {
        status: true,
        message: 'User registered',
        data: {
          user: @user
        }
      }, status: :created
    else
      render json: {
        status: false,
        message: 'Failed to register user',
        data: @user.errors
      }, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:username)
  end
end
