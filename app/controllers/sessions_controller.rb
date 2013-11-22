class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by_credentials(params[:user][:username],
    params[:user][:password])
    if @user
      session[:token] = @user.reset_session_token!
      flash[:messages] = "Welcome back #{@user.username}"
      redirect_to root_url
    else
      flash.now[:errors] = "Invalid Credentials"
      render :new
    end
  end

  def destroy
    @user = current_user
    @user.reset_session_token! if @user
    session[:token] = nil
    redirect_to new_session_url
  end

end
