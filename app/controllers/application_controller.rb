class ApplicationController < ActionController::Base
  protect_from_forgery

  def session_token(user)
    session[:token] = user.session_token!
  end

  def destroy_session
    session[:token] = nil
    user.session_token!
  end

  def current_user
    if session[:token].blank?
      return nil
    else
      return User.find_by_session_token(session[:token])
    end
  end
end
