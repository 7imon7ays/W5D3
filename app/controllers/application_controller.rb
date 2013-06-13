class ApplicationController < ActionController::Base
  protect_from_forgery

  def check_login
    @user = User.find_by_token(session[:token])
    p "USER PUHEFIOUSDHJPFOISDJ"
    p @user
    redirect_to new_session_url if @user.nil?
  end

  def current_user
    @user = User.find_by_token(session[:token])
  end

  helper_method :current_user
end
