module ApplicationHelper

  def current_user
    User.find_by(id: session[:user_id])
  end
    # helper_method :current_user

  def logged_in?
   current_user != nil
  end
    # helper_method :logged_in?
end
