class UsersController < ApplicationController

  before_filter :check_login, except: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])

    if @user.save
      session[:token] = @user.reset_session_token!
      redirect_to user_url(@user)
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.save
      redirect_to user_url(@user)
    else
      render :edit
    end
  end

  def index
    @users = User.all
  end

  def show

    p "SESSION TOKEN S:OKJAS:FKOJDF"
    p session[:token]

    @user = User.find(params[:id])

    if @user.nil?
      redirect_to new_session_url
      return
    end

  end

  def destroy
    @user = User.find(params[:id])
  end

end
