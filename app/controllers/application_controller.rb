class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include ApplicationHelper
    helper_method :current_user
    helper_method :logged_in?

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    !!session[:user_id]
  end

  def ensure_logged_in
    flash[:notice] = 'Please login'
    redirect_to login_path unless current_user
  end
end
