class PostsController < ApplicationController
  before_filter :make_sure_logged_in
  def new
    @post = Post.new
    @links = [Link.new] * 3
    render :new
  end

  def create
    params[:post][:user_id] = current_user.id
    @post = Post.new(params[:post])
    if @post.save
      redirect_to user_url(@post.author)
    else
      flash.now[:notice] = "that ain't the way to do it! " + @post.errors.full_messages * ','
      render :new
    end
  end

  def edit
  end
end
