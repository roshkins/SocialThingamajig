class FriendCirclesController < ApplicationController
  before_filter :make_sure_logged_in
  def new
    @users = User.all
    render :new
  end

  def create
    @friend_circle = FriendCircle.new(params[:friends_circle][:title])
    @friend_circle.member_ids = params[:friends_circle][:friends]
  end

  def edit
    @circle = FriendCircle.find_by_id(params[:id])
    render :new
  end
end
