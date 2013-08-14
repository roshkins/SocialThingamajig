class SessionsController < ApplicationController
  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.find_by_username(params[:user][:username])

    if @user && @user.password_digest_equals?(params[:user][:password])
      session_token(@user)
      redirect_to user_url(@user)
    else
      flash.now[:notice] = "Invalid username or password."
      render :new
    end
  end

  def destroy
    destroy_session
  end
end
