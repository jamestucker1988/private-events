class SessionsController < ApplicationController
  def new

  end
  def create
    @user = User.find(:name)
    if @user
      session[:user_id] = user.id
      redirect_to root_path
    else
      render :new
    end
  end
end