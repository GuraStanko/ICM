class PagesController < ApplicationController
  def index
  	@users = User.all
  	@posts = Post.all
  end

  def about
  end
  
  def user
  	@users = User.where(user_id: current_user)
  	@posts = Post.all
  end

end
