class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.find_by_name(params[:user][:name])

    unless @user
      redirect_to new_session_url
      return
    end

    if @user.valid_password?(params[:user][:password])
      session[:token] = @user.reset_session_token!
      redirect_to user_url(@user)
    else
      render :new
    end
  end

  def destroy
    @user = current_user
    @user.token = nil
    session[:token] = nil
    redirect_to new_session_url
  end

end
