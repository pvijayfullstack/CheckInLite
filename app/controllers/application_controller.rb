class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user, :user_valid

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
  
    def user_valid?
    if params[:user_id].blank?
      @user = User.find(params[:id])
    else
      @user = User.find(params[:user_id])
    end
    @current_user_from_session = User.find(session[:user_id]) if session[:user_id]
    if session[:user_id] == @user.id || @current_user_from_session && @current_user_from_session.email == "mike@mikeshea.net"
    #if session[:user_id] == @user.id
      return true
    else
      redirect_to(:root, :notice => 'You do not have permission for that page.')
    end
  end
  
end
