class UsersController < ApplicationController
  def new
    @user = User.new

  end
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to 'users/new', flash[:notice]='new use created'
    else
      render :new
    end

  end
  def show
    @user = User.find_by(id:session[:current_user_id])

  end
end
