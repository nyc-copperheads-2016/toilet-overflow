class UsersController < ApplicationController

  def create
    # byebug
    new_user = User.new(user_params)
    if new_user.save
      session[:user_id] = new_user.id
      redirect_to root_path
    else
      render :new_user_path
    end
  end

  private

  def user_params
    params.require(:new_user).permit(:username, :password, :email)
  end
end
