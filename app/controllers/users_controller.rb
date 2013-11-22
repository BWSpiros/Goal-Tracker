class UsersController < ApplicationController

  def new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      session[:token] = @user.reset_session_token!
      redirect_to root_url
    else
      flash[:error] = @user.errors.full_messages
      redirect_to new_user_url
    end
  end

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @goals = Goal.find_all_by_user_id(params[:id])
  end

end
