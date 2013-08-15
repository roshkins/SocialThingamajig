class ApplicationController < ActionController::Base
  protect_from_forgery

  include ApplicationHelper

  def session_token(user)
    session[:token] = user.session_token!
  end

  def destroy_session
    current_user.session_token!
    session[:token] = nil
  end



  def make_sure_logged_in
    redirect_to new_session_url unless logged_in?
  end


end
