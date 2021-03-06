class UsersController < ApplicationController
  def index
    if logged_in?
      @users = User.all
    else
      flash.now[:danger] = 'No access w/o login man!'
      redirect_to login_path
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "You're now logged in Chief!"
      redirect_to root_path
    else
      render 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email)
  end

end
