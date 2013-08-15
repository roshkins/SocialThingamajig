module ApplicationHelper
  def logged_in?
    !!(current_user)
  end

  def current_user
    if session[:token].blank?
      return nil
    else
      return @current_user ||= User.find_by_session_token(session[:token])
    end
  end
end
