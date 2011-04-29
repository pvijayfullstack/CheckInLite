class ApplicationController < ActionController::Base
  protect_from_forgery
  Time.zone = 'Eastern Time (US & Canada)'
  helper_method :current_user

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end  
end
