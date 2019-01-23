class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    params[:user][:admin] = params[:user][:admin] != '0'

    @user = User.create(user_params)
    session[:user_id] = @user.id
    redirect_to user_path(@user)
  end

  def show
    if session[:user_id]
      @user = User.find(params[:id])
    else
      redirect_to root_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :height, :happiness, :nausea, :tickets, :password, :admin)
  end
end
