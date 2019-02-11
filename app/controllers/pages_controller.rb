class PagesController < ApplicationController
  def index
  	@users = User.all
  	@posts = Post.all
    @likes = Like.sum(:like)
    @like = @likes
  end

  def about
  end
  
  def user
  	@users = User.where(user_id: current_user)
  	@posts = Post.all
  end

end
