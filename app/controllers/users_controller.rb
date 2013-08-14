class UsersController < ApplicationController
  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      session_token(@user)
      redirect_to user_url(@user)
    else
      flash.now[:notice] = @user.errors.full_messages * ", "
      render :new
    end
  end

  def show
    render :show
  end
end
