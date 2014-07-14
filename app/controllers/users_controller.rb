class UsersController < ApplicationController
  def new
    @user = User.new
  end



  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to @user
    else
      render new
    end
  end

private
  def user_params
    params.require(:user).permit(:email, :password, :password_hash)
  end


end
