class UsersController < ApplicationController
  def new
    @user = User.new
    redirect_to user_path(current_user) if logged_in?
  end

  def create
    @user = User.create(user_params)
    if @user.save
      session[:user_id] = @user.id
      session[:username] = @user.name
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def destroy
    session[:user_id] = nil
    session[:username] = nil
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end
end
