class ApplicationController < ActionController::Base
  protect_from_forgery
  Time.zone = 'Eastern Time (US & Canada)'
  helper_method :current_user

  private

  def login_required
    if session[:user_id]
      return true
    end
    flash[:warning]='Please login to continue'
    session[:return_to]=request.request_uri
    redirect_to(log_in_url)
    return false 
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end  
end
